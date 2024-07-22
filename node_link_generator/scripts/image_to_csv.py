#!/usr/bin/env python3

import rospy, rospkg
import cv2
import os
import yaml, csv

class Node:
    id = 0
    x = 0
    y = 0
    start = False
    mine = False

class ImageClick:
    def __init__(self, csv_file, yaml_file):
        self.image_path = ""
        self.csv_file = csv_file
        self.yaml_file = yaml_file

        self.selected_points = []
        self.resolution = 0.0
        self.origin = []

        self.nodes = []
        self.links = []

        self.point_radius = 5
        self.viz_id = True

        self.read_yaml_file()
        self.cv_image = cv2.imread(self.image_path)
        self.height, self.width, _ = self.cv_image.shape
        self.read_nodes_from_csv()
        
    def read_yaml_file(self):
        with open(self.yaml_file, 'r') as yaml_file:
            yaml_data = yaml.safe_load(yaml_file)
            directory = os.path.dirname(self.yaml_file)
            self.image_path = os.path.join(directory, yaml_data['image'])
            self.resolution = yaml_data['resolution']
            self.origin = yaml_data['origin']

        return yaml_data
        
    def read_nodes_from_csv(self):
        print("width: ", self.width, " height: ", self.height)
        if os.path.exists(self.csv_file):
            with open(self.csv_file, 'r') as csvfile:
                csv_reader = csv.reader(csvfile,delimiter=' ')
                for row in csv_reader:
                    try:
                        node = Node()
                        node.id = int(row[0])
                        node.x = int((float(row[1]) - self.origin[0]) / self.resolution)
                        node.y = self.height-int((float(row[2]) - self.origin[1]) / self.resolution)
                        linked_str = row[5][1:-1]
                        if linked_str:
                            linked_ids = [int(id.strip()) for id in linked_str.split(',') if id.strip()]
                            for linked_id in linked_ids:
                                new_link = (node.id, linked_id)
                                new_link = sorted(new_link)
                                if new_link not in self.links:
                                    self.links.append(new_link)
                        self.nodes.append(node)
                    except Exception as e:
                        print(f"Error processing row: {row}. Skipping row...")
                        print(f"Error message: {e}")

    def display_image(self):
        self.update_image()
        cv2.imshow("Map", self.cv_image)
        cv2.setMouseCallback("Map", self.mouse_callback)

        while cv2.getWindowProperty("Map", 0) >= 0 and not rospy.is_shutdown():
            cv2.waitKey(10)

        cv2.destroyAllWindows()

    def mouse_callback(self, event, x, y, flags, param):
        if event == cv2.EVENT_LBUTTONDOWN:
            node = Node()
            node.id = len(self.nodes) + 1
            node.x = x
            node.y = y
            self.nodes.append(node)
            print("Clicked point:", node.id, x, y)
            self.update_image()
        elif event == cv2.EVENT_MBUTTONDOWN:
            if len(self.selected_points) < 2:
                self.selected_points.append((x, y))
                print("Selected point:", x, y)
                if len(self.selected_points) == 2:
                    print("Connecting points...")
                    self.connect_points()
                    
    def update_image(self):
        self.cv_image = cv2.imread(self.image_path)
        for node in self.nodes:
            cv2.circle(self.cv_image, (node.x, node.y), self.point_radius, (255, 0, 0), -1)
            cv2.putText(self.cv_image, str(node.id), (node.x, node.y), cv2.FONT_HERSHEY_SIMPLEX, 0.5, (0, 0, 0), 1, cv2.LINE_AA)

        for node_ids in self.links:
            pt1, pt2 = node_ids
            pt1_i = next(i for i, node in enumerate(self.nodes) if node.id == pt1)
            pt2_i = next(i for i, node in enumerate(self.nodes) if node.id == pt2)
            cv2.line(self.cv_image, (self.nodes[pt1_i].x, self.nodes[pt1_i].y), (self.nodes[pt2_i].x, self.nodes[pt2_i].y), (0, 0, 255), 2)
        cv2.imshow("Map", self.cv_image)

    def connect_points(self):
        if len(self.selected_points) == 2:
            closesest_points = []
            for s_point in self.selected_points:
                min_dist = float("inf")
                closest_id = 0
                for node in self.nodes:
                    dist = (float(s_point[0] - node.x)**2 + float(s_point[1] - node.y)**2)**(0.5)
                    if dist < min_dist:
                        min_dist = dist
                        closest_id = node.id
                closesest_points.append(closest_id)
            self.links.append(tuple(closesest_points))
            print("Points connected:", self.selected_points)
            self.update_image()
            self.selected_points = []

    def save_points_to_csv(self):
        with open(self.csv_file, 'w') as csvfile:
            csvfile.write("id x y start mine linked\n")
            for node in self.nodes:
                linked_points = [p_id for link in self.links if node.id in link for p_id in link if p_id != node.id] 
                linked_points = list(dict.fromkeys(linked_points))
                linked_str = "[" + ",".join(str(p_id) for p_id in linked_points) + "]"
                x = (float(node.x) * self.resolution) + self.origin[0]
                y = (float(self.height-node.y) * self.resolution) + self.origin[1]
                csvfile.write(f"{node.id} {x} {y} {node.start} {node.mine} {linked_str}\n")
        print("Points and links saved to:", self.csv_file)
        print(self.links)

def main():
    rospy.init_node('image_click', anonymous=True)
    rospack = rospkg.RosPack()
    csv_file = rospack.get_path('node_link_generator')+'/points.csv'
    yaml_file = rospack.get_path('node_link_generator')+'/map_test.yaml'

    image_click = ImageClick(csv_file, yaml_file)
    if not os.path.exists(csv_file):
        with open(csv_file, 'w') as f:
            pass
    # else:
        # image_click.read_yaml_file()
        # image_click.read_nodes_from_csv()

    image_click.display_image()
    image_click.save_points_to_csv()

if __name__ == '__main__':
    main()
