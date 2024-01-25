# From https://www.youtube.com/watch?v=_x9K9_q2ZXE  (Min 24:30)
# https://www.kitware.com/import-cmake-c20-modules/
# Old school
# cmake_minimum_required(VERSION 3.27)
# project(my_project)
#
# add_executable(my_executable)
# target_sources(
#     my_executable
#     PUBLIC
#         ${PROJECT_SOURCE_DIR}/my_src.cpp
#         ${PROJECT_SOURCE_DIR}/inc/my_header1.h # not necessary as we have the include_directories
#         ${PROJECT_SOURCE_DIR}/inc/my_header2.h # not necessary as we have the include_directories
# )
# target_include_directories(my_executable ${PROJECT_SOURCE_DIR}/inc)
#

# > v3.23 
# cmake_minimum_required(VERSION 3.27)
# project(my_project)
#
# add_executable(my_executable)
# target_sources(
#     my_executable
#     PUBLIC ${PROJECT_SOURCE_DIR}/my_src.cpp
#     PUBLIC
#         FILE_SET
#             HEADERS # Particulary important when installing 3rd party libs
#         BASE_DIRS ${PROJECT_SOURCE_DIR}/inc
#         FILES
#             ${PROJECT_SOURCE_DIR}/inc/my_header1.h # not necessary as we have the include_directories
#             ${PROJECT_SOURCE_DIR}/inc/my_header2.h # not necessary as we have the include_directories
# )
#######################################

# With modules
#######################################
cmake_minimum_required(VERSION 3.28)
project(my_project)
set(CMAKE_CXX_STANDARD 23)

set(CMAKE_CXX_EXTENSIONS ON) # due to clang
set(CMAKE_CXX_SCAN_FOR_MODULES ON)

if(CMAKE_CXX_COMPILER_ID STREQUAL "GNU")
    add_compile_options(-fmodule)
endif()
if(CMAKE_CXX_COMPILER_ID STREQUAL "Clang")
    add_compile_options(-fmodule-ts)
endif()
# set(CMAKE_EXPERIMENTAL_CXX_MODULE_CMAKE_API
#     aa1f7df0-828a-4fcd-9afc-2dc80491aca7
# )

add_executable(my_executable)
target_sources(
    my_executable
    PUBLIC ${PROJECT_SOURCE_DIR}/main.cpp
    PUBLIC
        FILE_SET CXX_MODULES
        # BASE_DIRS ${PROJECT_SOURCE_DIR}/mod
        FILES ${PROJECT_SOURCE_DIR}/mod/module.cpp
)
