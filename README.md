# Long Term Goal
- Take in a natural language input from a human.
- Utilize LLMs in order interpet the command and translate the input into robotic movements.
- Follow the movements.

# Current Docker ROS2 + Gazebo Setup

## Docker Containers

- **ros_container**: This container runs the ROS2 environment, which you can access and interact with. The "/workspace" directory within this container is linked with the root directory of this repository on your computer.
  
- **novnc_container**: This container runs a noVNC server, allowing remote access to a virtual display through a web browser on localhost port 8080. It provides a graphical interface for the ROS container.

## Requirements

- Docker
- Docker Compose

Ensure you have both Docker and Docker Compose installed before using these scripts.

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

   Tip: Use the "Dev Containers" VSCode extension to open the workspace from within the docker container, this will stop you from having to run docker-exec every time you open a new terminal. It also makes tools like Pylance interact correctly with the libraries installed within the docker container.

4. **Opening the GUI**:
   Navigate to any web browser and paste the URL
   ```
   http://localhost:8080/vnc.html
   ```
   Then press "Connect"

5. **Testing Gazebo**:
   Open up a terminal within the ros_container (either through the noVNC interface or by running `scripts/docker-exec.sh`)

   CD to the workspace. The "/workspace" directory within this docker container is linked with the root directory of this repository on your computer.
   ```bash
   cd /workspace
   ```

   Build the project
   ```bash
   source scripts/build.sh
   ```

   Launch the simulation (this command will hang as long as the simulation is running)
   ```bash
   ros2 launch simulation launch.py
   ```

   Spawn a robot in the simulation (you'll have to run this in a new terminal)
   ```bash
   ros2 launch simulation spawn.py
   ```

   Remember to view the simulation by refering to step 4!

6. **Stop the containers**:
   ```bash
   scripts/docker-down.sh
   ```
