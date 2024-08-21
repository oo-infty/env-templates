cmake_minimum_required(VERSION 3.10)
project(cpp-out)

set(CMAKE_CXX_STANDARD 11)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

set(CMAKE_CXX_COMPILER "clang++")

add_executable(cpp-out src/main.cpp)

set(CMAKE_EXPORT_COMPILE_COMMANDS ON)
