#!/bin/bash

# source ROS and blockly_backend
source /opt/ros/$ROS_DISTRO/setup.bash
source /root/software/catkin_ws/devel/setup.bash

# launch blockly
roslaunch --wait blockly_backend blockly_backend.launch
