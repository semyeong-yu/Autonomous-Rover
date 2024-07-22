# Install script for directory: /home/ee405/catkin_ws/src/Armpi_Pro_code/hiwonder_servo_msgs

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
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/hiwonder_servo_msgs/msg" TYPE FILE FILES
    "/home/ee405/catkin_ws/src/Armpi_Pro_code/hiwonder_servo_msgs/msg/JointState.msg"
    "/home/ee405/catkin_ws/src/Armpi_Pro_code/hiwonder_servo_msgs/msg/ServoState.msg"
    "/home/ee405/catkin_ws/src/Armpi_Pro_code/hiwonder_servo_msgs/msg/ServoStateList.msg"
    "/home/ee405/catkin_ws/src/Armpi_Pro_code/hiwonder_servo_msgs/msg/CommandDuration.msg"
    "/home/ee405/catkin_ws/src/Armpi_Pro_code/hiwonder_servo_msgs/msg/CommandDurationList.msg"
    "/home/ee405/catkin_ws/src/Armpi_Pro_code/hiwonder_servo_msgs/msg/RawIdPosDur.msg"
    "/home/ee405/catkin_ws/src/Armpi_Pro_code/hiwonder_servo_msgs/msg/MultiRawIdPosDur.msg"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/hiwonder_servo_msgs/action" TYPE FILE FILES "/home/ee405/catkin_ws/src/Armpi_Pro_code/hiwonder_servo_msgs/action/ActionGroupRunner.action")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/hiwonder_servo_msgs/msg" TYPE FILE FILES
    "/home/ee405/catkin_ws/src/build/devel/share/hiwonder_servo_msgs/msg/ActionGroupRunnerAction.msg"
    "/home/ee405/catkin_ws/src/build/devel/share/hiwonder_servo_msgs/msg/ActionGroupRunnerActionGoal.msg"
    "/home/ee405/catkin_ws/src/build/devel/share/hiwonder_servo_msgs/msg/ActionGroupRunnerActionResult.msg"
    "/home/ee405/catkin_ws/src/build/devel/share/hiwonder_servo_msgs/msg/ActionGroupRunnerActionFeedback.msg"
    "/home/ee405/catkin_ws/src/build/devel/share/hiwonder_servo_msgs/msg/ActionGroupRunnerGoal.msg"
    "/home/ee405/catkin_ws/src/build/devel/share/hiwonder_servo_msgs/msg/ActionGroupRunnerResult.msg"
    "/home/ee405/catkin_ws/src/build/devel/share/hiwonder_servo_msgs/msg/ActionGroupRunnerFeedback.msg"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/hiwonder_servo_msgs/cmake" TYPE FILE FILES "/home/ee405/catkin_ws/src/build/Armpi_Pro_code/hiwonder_servo_msgs/catkin_generated/installspace/hiwonder_servo_msgs-msg-paths.cmake")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include" TYPE DIRECTORY FILES "/home/ee405/catkin_ws/src/build/devel/include/hiwonder_servo_msgs")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/roseus/ros" TYPE DIRECTORY FILES "/home/ee405/catkin_ws/src/build/devel/share/roseus/ros/hiwonder_servo_msgs")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/common-lisp/ros" TYPE DIRECTORY FILES "/home/ee405/catkin_ws/src/build/devel/share/common-lisp/ros/hiwonder_servo_msgs")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/gennodejs/ros" TYPE DIRECTORY FILES "/home/ee405/catkin_ws/src/build/devel/share/gennodejs/ros/hiwonder_servo_msgs")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  execute_process(COMMAND "/usr/bin/python3" -m compileall "/home/ee405/catkin_ws/src/build/devel/lib/python3/dist-packages/hiwonder_servo_msgs")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/python3/dist-packages" TYPE DIRECTORY FILES "/home/ee405/catkin_ws/src/build/devel/lib/python3/dist-packages/hiwonder_servo_msgs")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/pkgconfig" TYPE FILE FILES "/home/ee405/catkin_ws/src/build/Armpi_Pro_code/hiwonder_servo_msgs/catkin_generated/installspace/hiwonder_servo_msgs.pc")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/hiwonder_servo_msgs/cmake" TYPE FILE FILES "/home/ee405/catkin_ws/src/build/Armpi_Pro_code/hiwonder_servo_msgs/catkin_generated/installspace/hiwonder_servo_msgs-msg-extras.cmake")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/hiwonder_servo_msgs/cmake" TYPE FILE FILES
    "/home/ee405/catkin_ws/src/build/Armpi_Pro_code/hiwonder_servo_msgs/catkin_generated/installspace/hiwonder_servo_msgsConfig.cmake"
    "/home/ee405/catkin_ws/src/build/Armpi_Pro_code/hiwonder_servo_msgs/catkin_generated/installspace/hiwonder_servo_msgsConfig-version.cmake"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/hiwonder_servo_msgs" TYPE FILE FILES "/home/ee405/catkin_ws/src/Armpi_Pro_code/hiwonder_servo_msgs/package.xml")
endif()

