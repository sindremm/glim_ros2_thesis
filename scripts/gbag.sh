#!/bin/bash
set -e
source /opt/ros/jazzy/setup.bash
source /root/ros2_ws/install/setup.bash
ros2 run glim_ros glim_rosbag $1 --ros-args -p config_path:=/root/ros2_ws/src/glim/config