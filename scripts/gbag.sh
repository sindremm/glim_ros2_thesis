#!/bin/bash
set -e
ros2 run glim_ros glim_rosbag $1 --ros-args -p config_path:=/root/ros2_ws/src/glim/config