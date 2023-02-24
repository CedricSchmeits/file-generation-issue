#########################################
# Conan                                 #
set(CONAN_REQUIRES flatbuffers/23.1.21)

include(conan)

conan_cmake_configure(REQUIRES ${CONAN_REQUIRES}
                      OPTIONS zeromq:shared=True
                              libsodium:shared=True
                              flatbuffers:shared=True
                      GENERATORS cmake_find_package)

conan_cmake_autodetect(CONAN_SETTINGS)

set(CMAKE_CONAN_DIR  ${CMAKE_BINARY_DIR}/conan)

conan_cmake_install(PATH_OR_REFERENCE .
                    INSTALL_FOLDER ${CMAKE_CONAN_DIR}
                    BUILD missing
                    REMOTE conancenter
                    PROFILE_BUILD default
                    PROFILE_HOST ${CONAN_PROFILE_NAME}
                    SETTINGS ${CONAN_SETTINGS}
                             arch=${CONAN_BUILD_ARCH}
                             compiler=gcc)

list (APPEND CMAKE_MODULE_PATH ${CMAKE_CONAN_DIR})
list (APPEND CMAKE_PREFIX_PATH ${CMAKE_CONAN_DIR})

find_package(flatbuffers REQUIRED)
# End Conan                             #
#########################################

