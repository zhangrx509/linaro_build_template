cmake_minimum_required (VERSION 2.8)
# 项目信息
project (MY_PROJ)

message("CMake system name is ${CMAKE_SYSTEM_NAME}")

# 查找当前目录下的所有源文件
# 并将名称保存到 SRCS 变量
file(GLOB SRCS "${PROJECT_SOURCE_DIR}/src/*.c" "${PROJECT_SOURCE_DIR}/src/*.cpp")
file(GLOB INCS ${PROJECT_SOURCE_DIR}/include/*.h*)
include_directories(${PROJECT_SOURCE_DIR}/include)

# example of adding source subdir
file(GLOB SRC "${PROJECT_SOURCE_DIR}/src/CAN/*.c" "${PROJECT_SOURCE_DIR}/src/CAN/*.cpp")
set(SRCS "${SRCS};${SRC}")
file(GLOB INC ${PROJECT_SOURCE_DIR}/src/CAN/*.h*)
set(INCS "${INCS};${INC}")
include_directories(${PROJECT_SOURCE_DIR}/src/CAN)

#compiler flags
set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -fdiagnostics-show-option")
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -fdiagnostics-show-option")

set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++11")

# link flags
# uncomment the following if use link script
#set(LINK_SCRIPT "${PROJECT_SOURCE_DIR}/tools/build_scripts/my_proj.lds")
#set(CMAKE_EXE_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS} -Wl,-T,${LINK_SCRIPT},-Map,${CMAKE_PROJECT_NAME}.map")
set(CMAKE_EXE_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS} -Wl,-Map,${CMAKE_PROJECT_NAME}.map")

# 指定生成目标
add_executable(${CMAKE_PROJECT_NAME} ${SRCS} ${INCS})

# link lib
set(LINUX_LIB pthread rt)
target_link_libraries(${CMAKE_PROJECT_NAME} ${LINUX_LIB})
