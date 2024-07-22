# Install script for directory: /home/ee405/catkin_ws/src

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/usr/local")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "Debug")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

# Install shared libraries without execute permission?
if(NOT DEFINED CMAKE_INSTALL_SO_NO_EXE)
  set(CMAKE_INSTALL_SO_NO_EXE "1")
endif()

# Is this installation the result of a crosscompile?
if(NOT DEFINED CMAKE_CROSSCOMPILING)
  set(CMAKE_CROSSCOMPILING "FALSE")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  
      if (NOT EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}")
        file(MAKE_DIRECTORY "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}")
      endif()
      if (NOT EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/.catkin")
        file(WRITE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/.catkin" "")
      endif()
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/usr/local/_setup_util.py")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
file(INSTALL DESTINATION "/usr/local" TYPE PROGRAM FILES "/home/ee405/catkin_ws/src/build/catkin_generated/installspace/_setup_util.py")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/usr/local/env.sh")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
file(INSTALL DESTINATION "/usr/local" TYPE PROGRAM FILES "/home/ee405/catkin_ws/src/build/catkin_generated/installspace/env.sh")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/usr/local/setup.bash;/usr/local/local_setup.bash")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
file(INSTALL DESTINATION "/usr/local" TYPE FILE FILES
    "/home/ee405/catkin_ws/src/build/catkin_generated/installspace/setup.bash"
    "/home/ee405/catkin_ws/src/build/catkin_generated/installspace/local_setup.bash"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/usr/local/setup.sh;/usr/local/local_setup.sh")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
file(INSTALL DESTINATION "/usr/local" TYPE FILE FILES
    "/home/ee405/catkin_ws/src/build/catkin_generated/installspace/setup.sh"
    "/home/ee405/catkin_ws/src/build/catkin_generated/installspace/local_setup.sh"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/usr/local/setup.zsh;/usr/local/local_setup.zsh")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
file(INSTALL DESTINATION "/usr/local" TYPE FILE FILES
    "/home/ee405/catkin_ws/src/build/catkin_generated/installspace/setup.zsh"
    "/home/ee405/catkin_ws/src/build/catkin_generated/installspace/local_setup.zsh"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/usr/local/.rosinstall")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
file(INSTALL DESTINATION "/usr/local" TYPE FILE FILES "/home/ee405/catkin_ws/src/build/catkin_generated/installspace/.rosinstall")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for each subdirectory.
  include("/home/ee405/catkin_ws/src/build/gtest/cmake_install.cmake")
  include("/home/ee405/catkin_ws/src/build/Armpi_Pro_code/armpi_pro_bringup/cmake_install.cmake")
  include("/home/ee405/catkin_ws/src/build/realsense-ros/realsense2_description/cmake_install.cmake")
  include("/home/ee405/catkin_ws/src/build/rover_tf_bringup/cmake_install.cmake")
  include("/home/ee405/catkin_ws/src/build/object_detection/detection_msgs/cmake_install.cmake")
  include("/home/ee405/catkin_ws/src/build/Armpi_Pro_code/apriltag_detect/cmake_install.cmake")
  include("/home/ee405/catkin_ws/src/build/chassis_control/cmake_install.cmake")
  include("/home/ee405/catkin_ws/src/build/Armpi_Pro_code/color_tracking/cmake_install.cmake")
  include("/home/ee405/catkin_ws/src/build/Armpi_Pro_code/face_detect/cmake_install.cmake")
  include("/home/ee405/catkin_ws/src/build/Armpi_Pro_code/hiwonder_servo_driver/cmake_install.cmake")
  include("/home/ee405/catkin_ws/src/build/Armpi_Pro_code/hiwonder_servo_msgs/cmake_install.cmake")
  include("/home/ee405/catkin_ws/src/build/Armpi_Pro_code/intelligent_grasp/cmake_install.cmake")
  include("/home/ee405/catkin_ws/src/build/Armpi_Pro_code/intelligent_palletizer/cmake_install.cmake")
  include("/home/ee405/catkin_ws/src/build/Armpi_Pro_code/intelligent_transport/cmake_install.cmake")
  include("/home/ee405/catkin_ws/src/build/Armpi_Pro_code/lab_config/cmake_install.cmake")
  include("/home/ee405/catkin_ws/src/build/localization_manager/cmake_install.cmake")
  include("/home/ee405/catkin_ws/src/build/manipulation/cmake_install.cmake")
  include("/home/ee405/catkin_ws/src/build/Armpi_Pro_code/object_tracking/cmake_install.cmake")
  include("/home/ee405/catkin_ws/src/build/point_tf/cmake_install.cmake")
  include("/home/ee405/catkin_ws/src/build/Armpi_Pro_code/sensor/cmake_install.cmake")
  include("/home/ee405/catkin_ws/src/build/Armpi_Pro_code/hiwonder_servo_controllers/cmake_install.cmake")
  include("/home/ee405/catkin_ws/src/build/messages/llm_msgs/cmake_install.cmake")
  include("/home/ee405/catkin_ws/src/build/llm/cmake_install.cmake")
  include("/home/ee405/catkin_ws/src/build/pid_control/cmake_install.cmake")
  include("/home/ee405/catkin_ws/src/build/control_space_planner/cmake_install.cmake")
  include("/home/ee405/catkin_ws/src/build/graph_planner/cmake_install.cmake")
  include("/home/ee405/catkin_ws/src/build/local_costmap_generator/cmake_install.cmake")
  include("/home/ee405/catkin_ws/src/build/depthImage2pointCloud-master/cmake_install.cmake")
  include("/home/ee405/catkin_ws/src/build/realsense-ros/realsense2_camera/cmake_install.cmake")
  include("/home/ee405/catkin_ws/src/build/position_estimation/cmake_install.cmake")
  include("/home/ee405/catkin_ws/src/build/true_rt_tag/cmake_install.cmake")
  include("/home/ee405/catkin_ws/src/build/Armpi_Pro_code/visual_patrol/cmake_install.cmake")
  include("/home/ee405/catkin_ws/src/build/Armpi_Pro_code/visual_processing/cmake_install.cmake")
  include("/home/ee405/catkin_ws/src/build/object_detection/yolov5_ros/cmake_install.cmake")

endif()

if(CMAKE_INSTALL_COMPONENT)
  set(CMAKE_INSTALL_MANIFEST "install_manifest_${CMAKE_INSTALL_COMPONENT}.txt")
else()
  set(CMAKE_INSTALL_MANIFEST "install_manifest.txt")
endif()

string(REPLACE ";" "\n" CMAKE_INSTALL_MANIFEST_CONTENT
       "${CMAKE_INSTALL_MANIFEST_FILES}")
file(WRITE "/home/ee405/catkin_ws/src/build/${CMAKE_INSTALL_MANIFEST}"
     "${CMAKE_INSTALL_MANIFEST_CONTENT}")
