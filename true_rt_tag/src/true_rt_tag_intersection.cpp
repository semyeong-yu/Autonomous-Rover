#include <true_rt_tag/true_rt_tag.h>

TRUE_RT_TAG::TRUE_RT_TAG(ros::NodeHandle* nh, ros::Rate rate): _nh(nh), _rate(rate) 
{
    package_path = ros::package::getPath("true_rt_tag");

    _nh->getParam(ros::this_node::getName()+ "/tag_config_name", tag_config_name);
    _nh->getParam(ros::this_node::getName()+ "/world_frame_name", world_frame_name);
    _nh->getParam(ros::this_node::getName()+ "/camera_frame_name", camera_frame_name);
    _nh->getParam(ros::this_node::getName()+ "/image_frame_name", image_frame_name);

    true_rt_tag_pub = _nh->advertise<geometry_msgs::PoseStamped>("true_rt_tag_pose", 1);
    global_tag_pose_pub = _nh->advertise<geometry_msgs::PoseStamped>(camera_frame_name, 1);

    tag_detections_sub = _nh->subscribe("/tag_detections", 1, &TRUE_RT_TAG::tag_detections_cb, this);

    // World's front left up coordinate system to tag's right up depth coordinates
    tf2::Quaternion x90(DEG2RAD(0.0), DEG2RAD(90.0), DEG2RAD(0.0));
    tf2::Quaternion y_90(DEG2RAD(-90.0), DEG2RAD(00.0), DEG2RAD(0.0));
    tf2::Quaternion orientation = x90*y_90;

    orientation_correction.setRotation(orientation);
    orientation_correction.setOrigin(tf2::Vector3(0.0, 0.0, 0.0));

    if(loadTagConfig(tag_config_name))
        tag_config_loaded = true;

    // Initialize TF broadcaster
    if(initTFBroadcaster())
        tf_broadcaster_initialized = true;


    // Find tfs to find transform between camera mount frame and camera optical frame
    tf2_ros::Buffer tfBuffer;
    tf2_ros::TransformListener tfListener(tfBuffer);
    try
    {
        cam2optical_geo = tfBuffer.lookupTransform(camera_frame_name, image_frame_name, ros::Time(0), ros::Duration(10));
        camera_transform_found = true;
    }
    catch(tf2::TransformException &ex)
    {
        ROS_WARN("%s",ex.what());
        ros::Duration(1.0).sleep();
    }
}

bool TRUE_RT_TAG::initTFBroadcaster()
{
    for(size_t tf = 0; tf < tag_rts._transforms.size(); tf++)
    {
        tf2_ros::TransformBroadcaster tf_broadcaster;
        tf_broadcasters.push_back(tf_broadcaster);

        geometry_msgs::TransformStamped tag_transform;

        tag_transform.header.frame_id = "world";
        tag_transform.child_frame_id = "wTt"+ std::to_string(tag_rts._idxs.at(tf));

        tag_transform.transform = tf2::toMsg(tag_rts._transforms.at(tf));
        
        tag_transforms.push_back(tag_transform);
    }

    return true;
}

bool TRUE_RT_TAG::loadTagConfig(std::string file_name)
{
    std::string file_path = package_path + "/config/" + file_name + ".yaml";

    ROS_INFO_STREAM("Loading tag configuration..." << file_path);

    YAML::Node node;
    try{
        node = YAML::LoadFile(file_path);
    }
    catch(std::exception &e)
    {
        ROS_ERROR("Failed to load tag config.");
        return false;

    }

    for(size_t tag = 0; tag < node["TAG_TRUE_RT"]["TAGS"].size(); tag++)
    {
        int32_t tag_rt_idx = node["TAG_TRUE_RT"]["TAGS"][tag][0].as<int32_t>();
        double tag_rt_size = node["TAG_TRUE_RT"]["TAGS"][tag][1].as<double>();

        tf2::Transform tag_rt;
        geometry_msgs::Point location;
        location.x = node["TAG_TRUE_RT"]["TAGS"][tag][2].as<double>();
        location.y = node["TAG_TRUE_RT"]["TAGS"][tag][3].as<double>();
        location.z = node["TAG_TRUE_RT"]["TAGS"][tag][4].as<double>();

        double heading = node["TAG_TRUE_RT"]["TAGS"][tag][5].as<double>();
        tf2::Quaternion heading_quat;
        heading_quat.setRotation(tf2::Vector3(0.0, 0.0, 1.0), DEG2RAD(heading));

        tag_rt.setOrigin(tf2::Vector3(location.x, location.y, location.z));
        tag_rt.setRotation(heading_quat);
        tag_rt = tag_rt*orientation_correction;

        tag_rts._idxs.push_back(tag_rt_idx);
        tag_rts._sizes.push_back(tag_rt_size);
        tag_rts._transforms.push_back(tag_rt);

        ROS_INFO_STREAM("Tag info about " << tag_rt_idx << " is loaded successfully");
    }

    return true;
}

void TRUE_RT_TAG::tag_detections_cb(apriltag_ros::AprilTagDetectionArray msg)
{
    if(msg.detections.size() > 0)
    {
        tag_detection.detections.clear();
        tag_detection.header = msg.header;
        for(apriltag_ros::AprilTagDetection detection: msg.detections)
            for(int known_id: tag_rts._idxs)
                if(detection.id.at(0) == known_id)
                    tag_detection.detections.push_back(detection);
    }
    // else
    //     ROS_WARN("There is no detected tags...");
}

bool TRUE_RT_TAG::broadcastTagTF()
{
    if(!tf_broadcaster_initialized)
    {
        ROS_ERROR("TF broadcaster not initialized...");
        return false;
    }

    ros::Time now = ros::Time::now();
    for(size_t broadcaster = 0; broadcaster < tf_broadcasters.size(); broadcaster++)
    {
        tag_transforms.at(broadcaster).header.stamp = now;
        tf_broadcasters.at(broadcaster).sendTransform(tag_transforms.at(broadcaster));
    }
}

bool TRUE_RT_TAG::getTrueRT()
{
    if(tag_detection.header.stamp < ros::Time::now() - ros::Duration(1.0))
    {
        ROS_ERROR("Detection data are out-dated!!!");
        return false;
    }

    if(tag_detection.detections.size() == 0)
        return false;

    if(!tag_config_loaded)
    {
        ROS_ERROR("Configuration is not initialized...");
        return false;
    }

    if(!camera_transform_found)
    {
        ROS_ERROR("Camera transform does not initialized...");
        ROS_WARN("Please check launch arguments defining frames");
        return false;
    }

    
    // Selecting minimum distance tag to compute ground truth pose
    //? With only localization Tag environment
    std::vector<double> dist_to_tag;
    for(int32_t idx = 0; idx < tag_detection.detections.size(); idx++)
        dist_to_tag.push_back(sqrt(
            pow(tag_detection.detections.at(idx).pose.pose.pose.position.x, 2) + 
            pow(tag_detection.detections.at(idx).pose.pose.pose.position.y, 2) +
            pow(tag_detection.detections.at(idx).pose.pose.pose.position.z, 2)));
    
    std::vector<double>::iterator min = std::min_element(dist_to_tag.begin(), dist_to_tag.end());

    int32_t min_idx = std::distance(dist_to_tag.begin(), min);
    double min_dist = *min;

    int32_t id = tag_detection.detections.at(min_idx).id.at(0);

    //! With Tag-ed environment for multi-purpose
    // int reference_tag = -99;
    // int detection_tag = -99;
    // double min_dist2tag = 0.0;

    // std::vector<int> sorted_detections;
    // for(size_t detection = 0; detection < tag_detection.detections.size(); detection++)
    //     sorted_detections.push_back(tag_detection.detections.at(detection).id.at(0));

    // std::vector<int> sorted_true_tags(tag_rts._idxs);
    // sorted_true_tags = tag_rts._idxs;

    // std::sort(sorted_detections.begin(), sorted_detections.end());
    // std::sort(sorted_true_tags.begin(), sorted_true_tags.end());

    // std::vector<int> intersection; //sorted_detections.size()+sorted_true_tags.size() //std::vector<int>::iterator it = 
    // std::set_intersection(sorted_detections.begin(), sorted_detections.end(),
    //                         sorted_true_tags.begin(), sorted_true_tags.end(),
    //                         std::back_inserter(intersection));

    // if(intersection.size() == 0)
    //     return false;
    // else
    // {
    //     std::vector<double> dist_to_tag;
    //     for (int inter: intersection)
    //     {
    //         int tag_idx = 0;
    //         for(tag_idx; tag_idx < tag_detection.detections.size(); tag_idx++)
    //             if(tag_detection.detections.at(tag_idx).id.at(0) == inter)
    //                 break;


    //         dist_to_tag.push_back(sqrt(
    //             pow(tag_detection.detections.at(tag_idx).pose.pose.pose.position.x, 2) + 
    //             pow(tag_detection.detections.at(tag_idx).pose.pose.pose.position.y, 2) +
    //             pow(tag_detection.detections.at(tag_idx).pose.pose.pose.position.z, 2)));
    //     }
        
    //     std::vector<double>::iterator min = std::min_element(dist_to_tag.begin(), dist_to_tag.end());

    //     int32_t min_idx = std::distance(dist_to_tag.begin(), min);
    //     min_dist2tag = *min;

    //     // int tag = 0;
    //     // for(tag; tag < tag_detection.detections.size(); tag++)
    //     //     if(tag_detection.detections.at(tag).id.at(0) == intersection.at(min_idx))
    //     //     {
    //     //         ROS_INFO_STREAM("Intersection tag found at " << tag);
    //     //         break;
    //     //     }
    //     // reference_tag = std::distance(tag_rts._idxs.begin(), std::find(tag_rts._idxs.begin(), tag_rts._idxs.end(), intersection.at(min_idx)));
    //     reference_tag = intersection.at(min_idx);
    //     ROS_ERROR("FUCKED_HERE!");
    //     det
    // }

    // ROS_INFO_STREAM("Tag " << reference_tag << " at dist" << min_dist2tag);

    // // Find a ground truth RT wrt {WORLD} of identified tag
    // int config_idx = - 99;
    // config_idx = std::distance(tag_rts._idxs.begin(), std::find(tag_rts._idxs.begin(), tag_rts._idxs.end(), reference_tag));
    // ROS_INFO_STREAM("Tag config found at " << config_idx);

    // tf2::Transform global2tag_tf = tag_rts._transforms.at(config_idx);

    // // geometry_msgs::PoseStamped global2tag_geo;
    // // tf2::toMsg(global2tag_tf, global2tag_geo.pose);
    // // global2tag_geo.header.stamp = tag_detection.header.stamp;
    // // true_rt_tag_pub.publish(global2tag_geo);

    // //? Calculate transformation of camera wrt global frame
    // // Get transformation of camera to closest tag
    // geometry_msgs::Pose cam2tag_pose = tag_detection.detections.at(detection_tag).pose.pose.pose;
    // tf2::Transform optical2tag_tf;
    // tf2::fromMsg(cam2tag_pose, optical2tag_tf);
    ROS_INFO_STREAM("Tag " << id << " at dist" << min_dist);

    // Find a ground truth RT wrt {WORLD} of identified tag
    int config_idx = - 99;
    config_idx = std::distance(tag_rts._idxs.begin(), std::find(tag_rts._idxs.begin(), tag_rts._idxs.end(), id));
    ROS_INFO_STREAM("Tag config found at " << config_idx);

    tf2::Transform global2tag_tf = tag_rts._transforms.at(config_idx);

    // geometry_msgs::PoseStamped global2tag_geo;
    // tf2::toMsg(global2tag_tf, global2tag_geo.pose);
    // global2tag_geo.header.stamp = tag_detection.header.stamp;
    // true_rt_tag_pub.publish(global2tag_geo);

    //? Calculate transformation of camera wrt global frame
    // Get transformation of camera to closest tag
    geometry_msgs::Pose cam2tag_pose = tag_detection.detections.at(min_idx).pose.pose.pose;
    tf2::Transform optical2tag_tf;
    tf2::fromMsg(cam2tag_pose, optical2tag_tf);

    tf2::fromMsg(cam2optical_geo.transform, cam2optical_tf);

    // optical2tag_tf.inverse()*cam2optical_tf.inverse(); //? cam from {tag}
    // global2tag_tf*orientation_correction //? tag from {world}
    tf2::Transform global2_cam_tf = global2tag_tf*optical2tag_tf.inverse()*cam2optical_tf.inverse();

    geometry_msgs::PoseStamped global2cam_pose;
    tf2::toMsg(global2_cam_tf, global2cam_pose.pose);
    global2cam_pose.header.stamp = tag_detection.header.stamp;
    global2cam_pose.header.frame_id = "world";
    global_tag_pose_pub.publish(global2cam_pose);

    geometry_msgs::TransformStamped global2_cam_geo;
    global2_cam_geo.header.frame_id = "world";
    global2_cam_geo.header.stamp = ros::Time::now();
    global2_cam_geo.child_frame_id = camera_frame_name;
    global2_cam_geo.transform.translation.x = global2cam_pose.pose.position.x;
    global2_cam_geo.transform.translation.y = global2cam_pose.pose.position.y;
    global2_cam_geo.transform.translation.z = global2cam_pose.pose.position.z;
    global2_cam_geo.transform.rotation = global2cam_pose.pose.orientation;
    true_rt_tf_broadcaster.sendTransform(global2_cam_geo);

    ROS_INFO_STREAM("Global pose of camera: " << global2cam_pose);

    return true;
}