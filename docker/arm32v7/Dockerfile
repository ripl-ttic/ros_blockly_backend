# Base image
FROM duckietown/rpi-ros-kinetic-base:latest

# update apt lists and install system libraries, then clean the apt cache
RUN apt-get update && apt-get install -y \
    python3-pip \
    python3-yaml \
    # clean the apt cache
    && rm -rf /var/lib/apt/lists/*

# install python3 dependencies
RUN pip3 install \
    rospkg \
    rosdep \
    rosinstall_generator \
    wstool \
    rosinstall \
    autobahn

# set shell to bash
SHELL ["/bin/bash", "-c"]

# build blockly_backend
RUN mkdir -p /root/software/catkin_ws/src
RUN git clone --depth 1 https://github.com/ripl-ttic/ros_blockly_backend.git /root/software/catkin_ws/src/blockly_backend
RUN source /opt/ros/$ROS_DISTRO/setup.bash; catkin_make -j2 -C /root/software/catkin_ws

# configure entrypoint
COPY assets/entrypoint_ros_blockly_backend.sh /entrypoint_ros_blockly_backend.sh
ENTRYPOINT ["/ros_entrypoint.sh", "/entrypoint_ros_blockly_backend.sh"]
