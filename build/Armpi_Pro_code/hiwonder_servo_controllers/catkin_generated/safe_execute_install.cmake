execute_process(COMMAND "/home/ee405/catkin_ws/src/build/Armpi_Pro_code/hiwonder_servo_controllers/catkin_generated/python_distutils_install.sh" RESULT_VARIABLE res)

if(NOT res EQUAL 0)
  message(FATAL_ERROR "execute_process(/home/ee405/catkin_ws/src/build/Armpi_Pro_code/hiwonder_servo_controllers/catkin_generated/python_distutils_install.sh) returned error code ")
endif()
