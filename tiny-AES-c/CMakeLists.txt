cmake_minimum_required(VERSION 3.12)

#project(tiny-aes C)

# add_library(${PROJECT_NAME} "")
# target_sources(${PROJECT_NAME}
#    PRIVATE
#        ${CMAKE_CURRENT_LIST_DIR}/aes.c
#    INTERFACE
#        ${CMAKE_CURRENT_LIST_DIR}/aes.h
#        ${CMAKE_CURRENT_LIST_DIR}/aes.hpp
#)

#target_include_directories(${PROJECT_NAME}
#    INTERFACE
#        ${CMAKE_CURRENT_LIST_DIR}
#)

add_prog(tiny_aes "test.c;aes.c")

target_include_directories(tiny_aes
    INTERFACE
        ${CMAKE_CURRENT_LIST_DIR}
)
