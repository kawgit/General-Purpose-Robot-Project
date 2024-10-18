# Long Term Goal
- Take in a natural language input from a human
- Utilize LLMs in order interpet the command and translate the input into robotic movements
- Follow the movements

# Current Docker ROS2 + Gazebo Setup

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
   scripts/docker-build.sh
   ```

2. **Start the containers**:
   ```bash
   scripts/docker-up.sh
   ```

3. **Access the ROS container**:
   ```bash
   scripts/docker-exec.sh
   ```

4. **Opening the GUI**:
   Navigate to any web browser and paste the URL
   ```
   http://localhost:8080/vnc.html
   ```
   Then press "Connect"

5. **Testing Gazebo**:
   Open up a terminal within the ros_container (either through the noVNC interface or by running `scripts/docker-exec.sh`) and open Gazebo using
   ```bash
   gz sim
   ```

5. **Stop the containers**:
   ```bash
   scripts/docker-down.sh
   ```

## Requirements

- Docker
- Docker Compose

Ensure you have both Docker and Docker Compose installed before using these scripts.
