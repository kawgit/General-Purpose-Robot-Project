cmake_minimum_required(VERSION 3.8)
project(simulation)

find_package(ament_cmake REQUIRED)

install(
  DIRECTORY launch robots worlds
  DESTINATION share/${PROJECT_NAME}
)

ament_package()
