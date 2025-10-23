#! /bin/bash
docker run \
  -it \
  --rm \
  --net=host \
  --ipc=host \
  --pid=host \
  --name=glim_sim \
  -e=DISPLAY \
  -e=ROS_DOMAIN_ID \
  -v $(realpath config):/root/ros2_ws/src/glim/config \
  -v /dev/dri:/dev/dri:ro \
  my/ros:glim2-thesis \
  bash