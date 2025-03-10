# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "color_tracking: 0 messages, 1 services")

set(MSG_I_FLAGS "-Istd_msgs:/opt/ros/noetic/share/std_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(geneus REQUIRED)
find_package(genlisp REQUIRED)
find_package(gennodejs REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(color_tracking_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/ee405/catkin_ws/src/Armpi_Pro_code/color_tracking/srv/SetTarget.srv" NAME_WE)
add_custom_target(_color_tracking_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "color_tracking" "/home/ee405/catkin_ws/src/Armpi_Pro_code/color_tracking/srv/SetTarget.srv" ""
)

#
#  langs = gencpp;geneus;genlisp;gennodejs;genpy
#

### Section generating for lang: gencpp
### Generating Messages

### Generating Services
_generate_srv_cpp(color_tracking
  "/home/ee405/catkin_ws/src/Armpi_Pro_code/color_tracking/srv/SetTarget.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/color_tracking
)

### Generating Module File
_generate_module_cpp(color_tracking
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/color_tracking
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(color_tracking_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(color_tracking_generate_messages color_tracking_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/ee405/catkin_ws/src/Armpi_Pro_code/color_tracking/srv/SetTarget.srv" NAME_WE)
add_dependencies(color_tracking_generate_messages_cpp _color_tracking_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(color_tracking_gencpp)
add_dependencies(color_tracking_gencpp color_tracking_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS color_tracking_generate_messages_cpp)

### Section generating for lang: geneus
### Generating Messages

### Generating Services
_generate_srv_eus(color_tracking
  "/home/ee405/catkin_ws/src/Armpi_Pro_code/color_tracking/srv/SetTarget.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/color_tracking
)

### Generating Module File
_generate_module_eus(color_tracking
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/color_tracking
  "${ALL_GEN_OUTPUT_FILES_eus}"
)

add_custom_target(color_tracking_generate_messages_eus
  DEPENDS ${ALL_GEN_OUTPUT_FILES_eus}
)
add_dependencies(color_tracking_generate_messages color_tracking_generate_messages_eus)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/ee405/catkin_ws/src/Armpi_Pro_code/color_tracking/srv/SetTarget.srv" NAME_WE)
add_dependencies(color_tracking_generate_messages_eus _color_tracking_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(color_tracking_geneus)
add_dependencies(color_tracking_geneus color_tracking_generate_messages_eus)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS color_tracking_generate_messages_eus)

### Section generating for lang: genlisp
### Generating Messages

### Generating Services
_generate_srv_lisp(color_tracking
  "/home/ee405/catkin_ws/src/Armpi_Pro_code/color_tracking/srv/SetTarget.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/color_tracking
)

### Generating Module File
_generate_module_lisp(color_tracking
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/color_tracking
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(color_tracking_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(color_tracking_generate_messages color_tracking_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/ee405/catkin_ws/src/Armpi_Pro_code/color_tracking/srv/SetTarget.srv" NAME_WE)
add_dependencies(color_tracking_generate_messages_lisp _color_tracking_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(color_tracking_genlisp)
add_dependencies(color_tracking_genlisp color_tracking_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS color_tracking_generate_messages_lisp)

### Section generating for lang: gennodejs
### Generating Messages

### Generating Services
_generate_srv_nodejs(color_tracking
  "/home/ee405/catkin_ws/src/Armpi_Pro_code/color_tracking/srv/SetTarget.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/color_tracking
)

### Generating Module File
_generate_module_nodejs(color_tracking
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/color_tracking
  "${ALL_GEN_OUTPUT_FILES_nodejs}"
)

add_custom_target(color_tracking_generate_messages_nodejs
  DEPENDS ${ALL_GEN_OUTPUT_FILES_nodejs}
)
add_dependencies(color_tracking_generate_messages color_tracking_generate_messages_nodejs)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/ee405/catkin_ws/src/Armpi_Pro_code/color_tracking/srv/SetTarget.srv" NAME_WE)
add_dependencies(color_tracking_generate_messages_nodejs _color_tracking_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(color_tracking_gennodejs)
add_dependencies(color_tracking_gennodejs color_tracking_generate_messages_nodejs)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS color_tracking_generate_messages_nodejs)

### Section generating for lang: genpy
### Generating Messages

### Generating Services
_generate_srv_py(color_tracking
  "/home/ee405/catkin_ws/src/Armpi_Pro_code/color_tracking/srv/SetTarget.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/color_tracking
)

### Generating Module File
_generate_module_py(color_tracking
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/color_tracking
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(color_tracking_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(color_tracking_generate_messages color_tracking_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/ee405/catkin_ws/src/Armpi_Pro_code/color_tracking/srv/SetTarget.srv" NAME_WE)
add_dependencies(color_tracking_generate_messages_py _color_tracking_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(color_tracking_genpy)
add_dependencies(color_tracking_genpy color_tracking_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS color_tracking_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/color_tracking)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/color_tracking
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_cpp)
  add_dependencies(color_tracking_generate_messages_cpp std_msgs_generate_messages_cpp)
endif()
if(TARGET std_srvs_generate_messages_cpp)
  add_dependencies(color_tracking_generate_messages_cpp std_srvs_generate_messages_cpp)
endif()

if(geneus_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/color_tracking)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/color_tracking
    DESTINATION ${geneus_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_eus)
  add_dependencies(color_tracking_generate_messages_eus std_msgs_generate_messages_eus)
endif()
if(TARGET std_srvs_generate_messages_eus)
  add_dependencies(color_tracking_generate_messages_eus std_srvs_generate_messages_eus)
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/color_tracking)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/color_tracking
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_lisp)
  add_dependencies(color_tracking_generate_messages_lisp std_msgs_generate_messages_lisp)
endif()
if(TARGET std_srvs_generate_messages_lisp)
  add_dependencies(color_tracking_generate_messages_lisp std_srvs_generate_messages_lisp)
endif()

if(gennodejs_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/color_tracking)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/color_tracking
    DESTINATION ${gennodejs_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_nodejs)
  add_dependencies(color_tracking_generate_messages_nodejs std_msgs_generate_messages_nodejs)
endif()
if(TARGET std_srvs_generate_messages_nodejs)
  add_dependencies(color_tracking_generate_messages_nodejs std_srvs_generate_messages_nodejs)
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/color_tracking)
  install(CODE "execute_process(COMMAND \"/usr/bin/python3\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/color_tracking\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/color_tracking
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_py)
  add_dependencies(color_tracking_generate_messages_py std_msgs_generate_messages_py)
endif()
if(TARGET std_srvs_generate_messages_py)
  add_dependencies(color_tracking_generate_messages_py std_srvs_generate_messages_py)
endif()
