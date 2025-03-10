# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "llm_msgs: 1 messages, 1 services")

set(MSG_I_FLAGS "-Illm_msgs:/home/ee405/catkin_ws/src/messages/llm_msgs/msg;-Igeometry_msgs:/opt/ros/noetic/share/geometry_msgs/cmake/../msg;-Isensor_msgs:/opt/ros/noetic/share/sensor_msgs/cmake/../msg;-Istd_msgs:/opt/ros/noetic/share/std_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(geneus REQUIRED)
find_package(genlisp REQUIRED)
find_package(gennodejs REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(llm_msgs_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/ee405/catkin_ws/src/messages/llm_msgs/msg/task_plan.msg" NAME_WE)
add_custom_target(_llm_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "llm_msgs" "/home/ee405/catkin_ws/src/messages/llm_msgs/msg/task_plan.msg" ""
)

get_filename_component(_filename "/home/ee405/catkin_ws/src/messages/llm_msgs/srv/CallImage.srv" NAME_WE)
add_custom_target(_llm_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "llm_msgs" "/home/ee405/catkin_ws/src/messages/llm_msgs/srv/CallImage.srv" ""
)

#
#  langs = gencpp;geneus;genlisp;gennodejs;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(llm_msgs
  "/home/ee405/catkin_ws/src/messages/llm_msgs/msg/task_plan.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/llm_msgs
)

### Generating Services
_generate_srv_cpp(llm_msgs
  "/home/ee405/catkin_ws/src/messages/llm_msgs/srv/CallImage.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/llm_msgs
)

### Generating Module File
_generate_module_cpp(llm_msgs
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/llm_msgs
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(llm_msgs_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(llm_msgs_generate_messages llm_msgs_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/ee405/catkin_ws/src/messages/llm_msgs/msg/task_plan.msg" NAME_WE)
add_dependencies(llm_msgs_generate_messages_cpp _llm_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ee405/catkin_ws/src/messages/llm_msgs/srv/CallImage.srv" NAME_WE)
add_dependencies(llm_msgs_generate_messages_cpp _llm_msgs_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(llm_msgs_gencpp)
add_dependencies(llm_msgs_gencpp llm_msgs_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS llm_msgs_generate_messages_cpp)

### Section generating for lang: geneus
### Generating Messages
_generate_msg_eus(llm_msgs
  "/home/ee405/catkin_ws/src/messages/llm_msgs/msg/task_plan.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/llm_msgs
)

### Generating Services
_generate_srv_eus(llm_msgs
  "/home/ee405/catkin_ws/src/messages/llm_msgs/srv/CallImage.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/llm_msgs
)

### Generating Module File
_generate_module_eus(llm_msgs
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/llm_msgs
  "${ALL_GEN_OUTPUT_FILES_eus}"
)

add_custom_target(llm_msgs_generate_messages_eus
  DEPENDS ${ALL_GEN_OUTPUT_FILES_eus}
)
add_dependencies(llm_msgs_generate_messages llm_msgs_generate_messages_eus)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/ee405/catkin_ws/src/messages/llm_msgs/msg/task_plan.msg" NAME_WE)
add_dependencies(llm_msgs_generate_messages_eus _llm_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ee405/catkin_ws/src/messages/llm_msgs/srv/CallImage.srv" NAME_WE)
add_dependencies(llm_msgs_generate_messages_eus _llm_msgs_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(llm_msgs_geneus)
add_dependencies(llm_msgs_geneus llm_msgs_generate_messages_eus)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS llm_msgs_generate_messages_eus)

### Section generating for lang: genlisp
### Generating Messages
_generate_msg_lisp(llm_msgs
  "/home/ee405/catkin_ws/src/messages/llm_msgs/msg/task_plan.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/llm_msgs
)

### Generating Services
_generate_srv_lisp(llm_msgs
  "/home/ee405/catkin_ws/src/messages/llm_msgs/srv/CallImage.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/llm_msgs
)

### Generating Module File
_generate_module_lisp(llm_msgs
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/llm_msgs
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(llm_msgs_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(llm_msgs_generate_messages llm_msgs_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/ee405/catkin_ws/src/messages/llm_msgs/msg/task_plan.msg" NAME_WE)
add_dependencies(llm_msgs_generate_messages_lisp _llm_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ee405/catkin_ws/src/messages/llm_msgs/srv/CallImage.srv" NAME_WE)
add_dependencies(llm_msgs_generate_messages_lisp _llm_msgs_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(llm_msgs_genlisp)
add_dependencies(llm_msgs_genlisp llm_msgs_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS llm_msgs_generate_messages_lisp)

### Section generating for lang: gennodejs
### Generating Messages
_generate_msg_nodejs(llm_msgs
  "/home/ee405/catkin_ws/src/messages/llm_msgs/msg/task_plan.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/llm_msgs
)

### Generating Services
_generate_srv_nodejs(llm_msgs
  "/home/ee405/catkin_ws/src/messages/llm_msgs/srv/CallImage.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/llm_msgs
)

### Generating Module File
_generate_module_nodejs(llm_msgs
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/llm_msgs
  "${ALL_GEN_OUTPUT_FILES_nodejs}"
)

add_custom_target(llm_msgs_generate_messages_nodejs
  DEPENDS ${ALL_GEN_OUTPUT_FILES_nodejs}
)
add_dependencies(llm_msgs_generate_messages llm_msgs_generate_messages_nodejs)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/ee405/catkin_ws/src/messages/llm_msgs/msg/task_plan.msg" NAME_WE)
add_dependencies(llm_msgs_generate_messages_nodejs _llm_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ee405/catkin_ws/src/messages/llm_msgs/srv/CallImage.srv" NAME_WE)
add_dependencies(llm_msgs_generate_messages_nodejs _llm_msgs_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(llm_msgs_gennodejs)
add_dependencies(llm_msgs_gennodejs llm_msgs_generate_messages_nodejs)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS llm_msgs_generate_messages_nodejs)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(llm_msgs
  "/home/ee405/catkin_ws/src/messages/llm_msgs/msg/task_plan.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/llm_msgs
)

### Generating Services
_generate_srv_py(llm_msgs
  "/home/ee405/catkin_ws/src/messages/llm_msgs/srv/CallImage.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/llm_msgs
)

### Generating Module File
_generate_module_py(llm_msgs
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/llm_msgs
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(llm_msgs_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(llm_msgs_generate_messages llm_msgs_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/ee405/catkin_ws/src/messages/llm_msgs/msg/task_plan.msg" NAME_WE)
add_dependencies(llm_msgs_generate_messages_py _llm_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ee405/catkin_ws/src/messages/llm_msgs/srv/CallImage.srv" NAME_WE)
add_dependencies(llm_msgs_generate_messages_py _llm_msgs_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(llm_msgs_genpy)
add_dependencies(llm_msgs_genpy llm_msgs_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS llm_msgs_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/llm_msgs)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/llm_msgs
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
if(TARGET geometry_msgs_generate_messages_cpp)
  add_dependencies(llm_msgs_generate_messages_cpp geometry_msgs_generate_messages_cpp)
endif()
if(TARGET sensor_msgs_generate_messages_cpp)
  add_dependencies(llm_msgs_generate_messages_cpp sensor_msgs_generate_messages_cpp)
endif()
if(TARGET std_msgs_generate_messages_cpp)
  add_dependencies(llm_msgs_generate_messages_cpp std_msgs_generate_messages_cpp)
endif()

if(geneus_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/llm_msgs)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/llm_msgs
    DESTINATION ${geneus_INSTALL_DIR}
  )
endif()
if(TARGET geometry_msgs_generate_messages_eus)
  add_dependencies(llm_msgs_generate_messages_eus geometry_msgs_generate_messages_eus)
endif()
if(TARGET sensor_msgs_generate_messages_eus)
  add_dependencies(llm_msgs_generate_messages_eus sensor_msgs_generate_messages_eus)
endif()
if(TARGET std_msgs_generate_messages_eus)
  add_dependencies(llm_msgs_generate_messages_eus std_msgs_generate_messages_eus)
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/llm_msgs)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/llm_msgs
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
if(TARGET geometry_msgs_generate_messages_lisp)
  add_dependencies(llm_msgs_generate_messages_lisp geometry_msgs_generate_messages_lisp)
endif()
if(TARGET sensor_msgs_generate_messages_lisp)
  add_dependencies(llm_msgs_generate_messages_lisp sensor_msgs_generate_messages_lisp)
endif()
if(TARGET std_msgs_generate_messages_lisp)
  add_dependencies(llm_msgs_generate_messages_lisp std_msgs_generate_messages_lisp)
endif()

if(gennodejs_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/llm_msgs)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/llm_msgs
    DESTINATION ${gennodejs_INSTALL_DIR}
  )
endif()
if(TARGET geometry_msgs_generate_messages_nodejs)
  add_dependencies(llm_msgs_generate_messages_nodejs geometry_msgs_generate_messages_nodejs)
endif()
if(TARGET sensor_msgs_generate_messages_nodejs)
  add_dependencies(llm_msgs_generate_messages_nodejs sensor_msgs_generate_messages_nodejs)
endif()
if(TARGET std_msgs_generate_messages_nodejs)
  add_dependencies(llm_msgs_generate_messages_nodejs std_msgs_generate_messages_nodejs)
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/llm_msgs)
  install(CODE "execute_process(COMMAND \"/usr/bin/python3\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/llm_msgs\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/llm_msgs
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
if(TARGET geometry_msgs_generate_messages_py)
  add_dependencies(llm_msgs_generate_messages_py geometry_msgs_generate_messages_py)
endif()
if(TARGET sensor_msgs_generate_messages_py)
  add_dependencies(llm_msgs_generate_messages_py sensor_msgs_generate_messages_py)
endif()
if(TARGET std_msgs_generate_messages_py)
  add_dependencies(llm_msgs_generate_messages_py std_msgs_generate_messages_py)
endif()
