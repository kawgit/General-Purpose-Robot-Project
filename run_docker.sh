#!/bin/bash

CURRENT_DIR=$(pwd)
DOCKER_IMAGE="ros2_playground"
CONTAINER_NAME="ros2_playground"

HOST_IP=$(ipconfig getifaddr en0)
export DISPLAY="$HOST_IP:0"

xhost +$HOST_IP

docker run -it --rm \
    --name $CONTAINER_NAME \
    --mount type=bind,source="$CURRENT_DIR",target=/root/ros2_ws \
    --env DISPLAY=$DISPLAY \
    $DOCKER_IMAGE

xhost -$HOST_IP