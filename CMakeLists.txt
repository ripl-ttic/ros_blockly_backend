cmake_minimum_required(VERSION 2.8.3)
project(blockly_backend)

find_package(catkin REQUIRED COMPONENTS
    roscpp
    rospy
    std_msgs
    message_generation
)

add_service_files(
    FILES
    SetCurrentBlockId.srv
)

generate_messages(
  DEPENDENCIES
  std_msgs
)

catkin_install_python(PROGRAMS
  scripts/backend.py
  DESTINATION ${CATKIN_PACKAGE_BIN_DESTINATION}/scripts
)

install(DIRECTORY launch
  DESTINATION ${CATKIN_PACKAGE_SHARE_DESTINATION}
)

catkin_package(CATKIN_DEPENDS std_msgs message_runtime)
