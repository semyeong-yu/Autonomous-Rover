#include <ros/ros.h>
#include <vector>
#include <fstream>
#include <sstream>
#include <string>
#include <algorithm>
#include <climits>
#include <queue>
#include <iostream>

#include <sensor_msgs/PointCloud.h>
#include <visualization_msgs/Marker.h>
#include <visualization_msgs/MarkerArray.h>
#include <geometry_msgs/Point.h>
#include <nav_msgs/Path.h>
#include <nav_msgs/Odometry.h>

#include <pcl_conversions/pcl_conversions.h>
#include <pcl/point_cloud.h>
#include <pcl/point_types.h>
#include <pcl/conversions.h>
#include <pcl_ros/point_cloud.h>
#include <sensor_msgs/PointCloud.h>

#include <sensor_msgs/PointCloud.h>
#include <sensor_msgs/PointCloud.h>

#include <graph_planner/graph_planner.h>

GraphPlanner::GraphPlanner(ros::NodeHandle& nh) : nh_(nh)
{
    nh_.getParam("/graph_planner_node/csv_path", csv_path);
    nh_.getParam("/graph_planner_node/robot_postion_topic", robot_postion_topic);

    sub_robot_position = nh_.subscribe(robot_postion_topic, 1, &GraphPlanner::RobotPositionCB, this);
    sub_goal_position = nh_.subscribe("/move_base_simple/goal", 1, &GraphPlanner::GoalPositionCB, this);

    pub_global_path = nh_.advertise<nav_msgs::Path>("/waypoint_generator/global_path", 1);
    pub_node_points = nh_.advertise<sensor_msgs::PointCloud2>("/waypoint_generator/node_points", 1);

    LoadCSV(csv_path); 
    UpdateEdgeWeight(); 


}
GraphPlanner::~GraphPlanner()
{

}

double GraphPlanner::calculateDistance(double x1, double y1, double x2, double y2) {
    return std::sqrt((x2 - x1) * (x2 - x1) + (y2 - y1) * (y2 - y1));
}

int GraphPlanner::findClosestNode(const geometry_msgs::PoseStamped& pose, const std::vector<Node>& nodes) {
    double minDistance = DBL_MAX;
    int closestNodeId = -1;

    double x = pose.pose.position.x;
    double y = pose.pose.position.y;

    for (const auto& node : nodes) {
        double distance = calculateDistance(x, y, node.x, node.y);
        if (distance < minDistance) {
            minDistance = distance;
            closestNodeId = node.id;
        }
    }

    return closestNodeId;
}

void GraphPlanner::RobotPositionCB(const nav_msgs::Odometry &msg)
{
    geometry_msgs::Pose tmp_pose = msg.pose.pose;
    geometry_msgs::PoseStamped robot_pose;
    robot_pose.pose = tmp_pose;
    start_node = findClosestNode(robot_pose, nodes);
    bGetRobotPose = true;
}

void GraphPlanner::GoalPositionCB(const geometry_msgs::PoseStamped &msg)
{
    geometry_msgs::PoseStamped goal_pose = msg;
    goal_node = findClosestNode(goal_pose, nodes);

    bGetGoalPose = true;

}

std::vector<std::pair<Node, int>> GraphPlanner::dijkstra(int start) 
{
    // 최단 거리를 저장하는 배열
    std::vector<int> dist(nodes.size(), INT_MAX);
    dist[start] = 0;    //! index starts from 0

    std::priority_queue<Edge, std::vector<Edge>, std::greater<Edge>> pq;
    pq.push({0, start});    //! distance, node id(1 ~ 16)

    while (!pq.empty()) {
        double currentDist = pq.top().first;
        int currentNode = pq.top().second;
        pq.pop();

        std::cout << "======================" << std::endl;
        // std::cout << "currentNodeID : " << currentNode << " currentDist : " << currentDist << std::endl;
        if (currentDist > dist[currentNode - 1]) 
        {
            ROS_INFO("Already process node");
            continue;
        }
        if (nodes[currentNode - 1].visited)
        {
            ROS_INFO("Already visited node");
            continue;   //! if robot visit node. Visit true  
        } 

        for (const auto& edge : graph[currentNode]) //! current node와 연결된 edge
        {
            int nextNode = edge.first;
            double weight = edge.second;

            std::cout << "currentNode : " << currentNode  << " nextNode : " << nextNode << " weight : " << weight << std::endl;

            double newDist = weight;

            if (newDist < dist[nextNode - 1]) {
                dist[nextNode - 1] = newDist;
                pq.push({newDist, nextNode});
            }
        }
    }

    std::vector<std::pair<Node, int>> result;
    for (size_t i = 0; i < nodes.size(); ++i) {
        result.push_back({nodes[i], dist[i]});
    }

    return result;
}

void GraphPlanner::addNode(int id, int x, int y) 
{ //! node id, (x,y) position, visit
    nodes.push_back({id, x, y, false});
}

void GraphPlanner::addEdge(int u, int v, double w) 
{
    graph[u].push_back({v, w});
    graph[v].push_back({u, w});     //! if undirected graph include this line
}

void GraphPlanner::removeEdge(int u, int v) 
{
    graph[u].erase(remove_if(graph[u].begin(), graph[u].end(), [v](const Edge& edge) {
        return edge.first == v;
    }), graph[u].end());

    graph[v].erase(remove_if(graph[v].begin(), graph[v].end(), [u](const Edge& edge) {
        return edge.first == u;
    }), graph[v].end());
}

void GraphPlanner::updateEdge(int u, int v, int w) 
{
    for (auto& edge : graph[u]) {
        if (edge.first == v) {
            edge.second = w;
            break;
        }
    }
    for (auto& edge : graph[v]) {
        if (edge.first == u) {
            edge.second = w;
            break;
        }
    }
}

void GraphPlanner::UpdateEdgeWeight() 
{
    for(auto node: nodes)
    {
       for(auto& edge : graph[node.id])
       {
            double weight = std::sqrt(std::pow(node.x - nodes[edge.first - 1].x, 2) + 
                                        std::pow(node.y - nodes[edge.first - 1].y, 2));
            
            edge.second = weight;
            // std::cout << "current node : " << node.id << " neighborId : " << edge.first << " weight : " << weight << std::endl;
       }
    }

    
}

void GraphPlanner::Plan()
{
    p_nodes.reset(new pcl::PointCloud<pcl::PointXYZI>);

    std::vector<std::pair<Node, int>> shortestPaths = dijkstra(start_node);

    for (const auto& [node, distance] : shortestPaths) {
        if(distance == INT_MAX)
        {
            ROS_WARN_THROTTLE(1.0, "Cannot reaching this node");
        }
        else
        {
            ROS_INFO_THROTTLE(1.0, "Find Path");

            pcl::PointXYZI p_node_buf;
            p_node_buf.x = node.x;
            p_node_buf.y = node.y;
            p_node_buf.z = 0.0;
            p_node_buf.intensity = distance;
            p_nodes->push_back(p_node_buf);
        }
    }

    pcl::toROSMsg(*p_nodes, m_node_points);
    m_node_points.header.frame_id = "odom";

    pub_node_points.publish(m_node_points);
}

void GraphPlanner::LoadCSV(const std::string& filename) 
{
    std::cout << filename << std::endl;
    std::ifstream file(filename);
    if (!file.is_open()) {
        std::cerr << "Check file path." << std::endl;
    }

    std::string line;
    std::string header;

    getline(file, header);
    
    while (getline(file, line)) {
        std::stringstream ss(line);
        std::string id, x, y, visit, edgeStr;

        getline(ss, id, ' ');
        getline(ss, x, ' ');
        getline(ss, y, ' ');
        getline(ss, visit, ' ');
        getline(ss, edgeStr, ' ');


        // std::cout << "id : " << id << std::endl;
        // std::cout << "x : " << x << std::endl;
        // std::cout << "y : " << y << std::endl;
        int nodeId = std::stoi(id);
        double nodeX = std::stod(x);
        double nodeY = std::stod(y);
        // std::cout << "nodeId : " << nodeId << " nodeX : " << nodeX << " nodeY : " << nodeY << std::endl;

        addNode(nodeId, nodeX, nodeY);

        // std::stringstream edgeStream(edgeStr);
        // std::string edge;
        // while (getline(edgeStream, edge, ',')) {
        //     int neighborId = std::stoi(edge);
        //     addEdge(nodeId, neighborId, 1);
        // }

         // Process the edge information
        std::vector<int> edgeNodes;
        size_t pos = edgeStr.find('['); // Find the starting bracket of the edge list
        if (pos != std::string::npos) {
            // Erase the leading '[' character
            edgeStr.erase(0, pos + 1);

            // Find and replace ']' character with a whitespace
            pos = edgeStr.find(']');
            if (pos != std::string::npos) {
                edgeStr.replace(pos, 1, " ");
            }

            // Parse the list of edge nodes
            std::stringstream edgeStream(edgeStr);
            std::string node;
            while (edgeStream >> node) {
                edgeNodes.push_back(std::stoi(node));
            }

            // Connect the current node with edge nodes
            for (int neighborId : edgeNodes) {
                // double weight = 
                // std::cout << "nodeId : " << nodeId << " neighborId : " << neighborId << " weight : " << weight << std::endl;
                addEdge(nodeId, neighborId, 0.0);
            }
        }


    }
    file.close();
}

void GraphPlanner::run()
{
    if(bGetRobotPose && bGetGoalPose)
    {
        Plan();
    }
    else
    {
        ROS_WARN_THROTTLE(0.5, "bGetRobotPose %d bGetGoalPose %d", bGetRobotPose, bGetGoalPose);
    }
}

int main(int argc, char **argv)
{

    ros::init(argc, argv, "GraphPlanner");
    ros::NodeHandle _nh("~");

    printf("Initiate: GraphPlanner\n");

    GraphPlanner node_link_loader(_nh);
    ros::Rate loop_rate(30);
    while (ros::ok())
    {
        node_link_loader.run();
        ros::spinOnce();
        loop_rate.sleep();
    }
    printf("Terminate: GraphPlanner\n");

    return 0;
}