#this is required
SET(CMAKE_SYSTEM_NAME Linux)

# specify the cross compiler
SET(CMAKE_C_COMPILER   $ENV{LINARO_XC}/bin/aarch64-linux-gnu-gcc)
SET(CMAKE_CXX_COMPILER $ENV{LINARO_XC}/bin/aarch64-linux-gnu-g++)

# where is the target environment 
SET(CMAKE_FIND_ROOT_PATH  $ENV{LINARO_XC})

# search for programs in the build host directories (not necessary)
SET(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)
# for libraries and headers in the target directories
SET(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)
SET(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)
