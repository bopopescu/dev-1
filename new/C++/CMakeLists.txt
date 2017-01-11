cmake_minimum_required(VERSION 3.6)
project(C__)

set(CMAKE_CXX_STANDARD 11)

set(SOURCE_FILES main.cpp lesson_0.cpp lesson_0.h lesson_1.cpp lesson_1.h lesson_2.cpp lesson_2.h lesson_3.cpp lesson_3.h lesson_4.cpp lesson_4.h)
add_executable(C__ ${SOURCE_FILES})