FROM ubuntu:noble

WORKDIR /root/ros2_ws
CMD ["/bin/bash"]

# Update and upgrade the system
RUN apt update && apt upgrade -y

# Install ROS following https://docs.ros.org/en/jazzy/Installation/Alternatives/Ubuntu-Development-Setup.html
RUN apt install -y software-properties-common && \
    add-apt-repository universe && \
    apt update && \
    apt install -y curl && \
    curl -sSL https://raw.githubusercontent.com/ros/rosdistro/master/ros.key -o /usr/share/keyrings/ros-archive-keyring.gpg && \
    echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/ros-archive-keyring.gpg] http://packages.ros.org/ros2/ubuntu $(. /etc/os-release && echo $UBUNTU_CODENAME) main" | tee /etc/apt/sources.list.d/ros2.list > /dev/null && \
    apt update && \
    apt install -y ros-dev-tools ros-jazzy-desktop ros-jazzy-ros-base && \
    echo "source /opt/ros/jazzy/setup.bash" >> ~/.bashrc

# Install Gazebo following https://gazebosim.org/docs/harmonic/ros_installation/
RUN apt-get install -y ros-jazzy-ros-gz

# Verify Display Integration with xeyes
RUN apt install -y x11-apps

# Install x11vnc, xvfb, and xeyes for VNC setup
RUN apt install -y x11vnc xvfb x11-apps

# Setup VNC password
RUN mkdir ~/.vnc && x11vnc -storepasswd 1234 ~/.vnc/passwd
