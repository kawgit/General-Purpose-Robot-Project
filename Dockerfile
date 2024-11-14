FROM ubuntu:noble

# Update and upgrade the system
RUN apt update && apt upgrade -y

# -------------------- Install ROS2 and Gazebo --------------------

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
RUN apt install -y ros-jazzy-ros-gz

# -------------------- Install GUI --------------------

# Install necessary X11 and OpenGL libraries for GUI
RUN apt install -y --no-install-recommends \
    mesa-common-dev \
    libgl1 \
    libglvnd0 \
    libglx-mesa0 \
    libglx0 \
    libopengl0 \
    libglu1-mesa \
    libxcb-glx0 \
    libxrender1 \
    libxext6 \
    libxtst6 \
    mesa-utils \
    x11-utils \
    x11-xserver-utils \
    x11-apps

ENV DISPLAY=novnc:0.0 \
    XDG_RUNTIME_DIR=/tmp/runtime-root \
    LIBGL_ALWAYS_SOFTWARE=1

# -------------------- Install CycloneDDS --------------------

RUN apt install -y ros-jazzy-rmw-cyclonedds-cpp
ENV RMW_IMPLEMENTATION=rmw_cyclonedds_cpp

# -------------------- Source ROS2 Workspace Setup --------------------

RUN echo "source /workspace/install/setup.sh" >> ~/.bashrc
