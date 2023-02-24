cmake_minimum_required(VERSION 3.9)

include(CMakeDependentOption)

# Include the necessary cmake modules
list(APPEND CMAKE_MODULE_PATH "${CMAKE_CURRENT_SOURCE_DIR}/cmake")

project(Test
        VERSION 0.0.1
        DESCRIPTION "Test project")

set_property(CACHE CMAKE_BUILD_TYPE PROPERTY STRINGS "Debug" "Release" "RelWithDebInfo" "MinSizeRel")

set(DEFAULT_BUILD_TYPE "Debug")
if (NOT CMAKE_BUILD_TYPE)
    set(CMAKE_BUILD_TYPE "${DEFAULT_BUILD_TYPE}" CACHE STRING "Choose the type of build" FORCE)
    # Set the possible values of build type for cmake-gui
endif()

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_EXTENSIONS OFF)

set(CONAN_BUILD_ARCH x86_64)

include(dependencies)


set(INTERFACE_FBS ${CMAKE_CURRENT_SOURCE_DIR}/fbs/testapi.fbs)

flatbuffers_generate_headers(TARGET incl
                             SCHEMAS ${INTERFACE_FBS}
                             FLAGS --scoped-enums --cpp-std c++17)
target_link_libraries(incl INTERFACE flatbuffers::flatbuffers)
set_directory_properties(PROPERTIES ADDITIONAL_CLEAN_FILES incl)

#add_executable(testapp app/src/test.cpp)
#target_link_libraries(testapp incl)

add_subdirectory(app)