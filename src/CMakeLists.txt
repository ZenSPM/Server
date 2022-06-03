cmake_minimum_required(VERSION 3.16)
project(Server)

set(CMAKE_CXX_STANDARD 11)
find_package(imgui REQUIRED)
find_package(OpenGL REQUIRED)

add_executable(Server main.cpp)
include_directories(${OPENGL_INCLUDE_DIRS})
target_link_libraries(Server PRIVATE imgui::imgui)
target_link_libraries(Server PRIVATE ${OPENGL_LIBRARIES})