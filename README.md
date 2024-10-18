# Docker ROS2 + Gazebo Setup

## Containers

- **ros_container**: This container runs the ROS2 environment, which you can access and interact with. It keeps running with a `tail -f /dev/null` command to allow for manual interaction.
  
- **novnc_container**: This container runs a noVNC server, allowing remote access to a virtual display through a web browser on port 8080. It provides a graphical interface for the ROS container.

## Main Files
- **Dockerfile**: Defines the base image and setup for the ROS environment.
- **docker-compose.yml**: Configuration for setting up the ROS container(s).

## Helpful Scripts
- **docker-build.sh**: Builds the Docker containers.
- **docker-up.sh**: Starts the containers in detached mode.
- **docker-down.sh**: Stops and removes the containers.
- **docker-exec.sh**: Opens a bash shell in the running ROS container.

## Usage

1. **Build the containers**:
   ```bash
   ./docker-build.sh
   ```

2. **Start the containers**:
   ```bash
   ./docker-up.sh
   ```

3. **Access the ROS container**:
   ```bash
   ./docker-exec.sh
   ```

4. **Stop the containers**:
   ```bash
   ./docker-down.sh
   ```

## Requirements

- Docker
- Docker Compose

Ensure you have both Docker and Docker Compose installed before using these scripts.