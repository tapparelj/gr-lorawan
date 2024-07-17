find_package(PkgConfig)

PKG_CHECK_MODULES(PC_GR_LORAWAN gnuradio-lorawan)

FIND_PATH(
    GR_LORAWAN_INCLUDE_DIRS
    NAMES gnuradio/lorawan/api.h
    HINTS $ENV{LORAWAN_DIR}/include
        ${PC_LORAWAN_INCLUDEDIR}
    PATHS ${CMAKE_INSTALL_PREFIX}/include
          /usr/local/include
          /usr/include
)

FIND_LIBRARY(
    GR_LORAWAN_LIBRARIES
    NAMES gnuradio-lorawan
    HINTS $ENV{LORAWAN_DIR}/lib
        ${PC_LORAWAN_LIBDIR}
    PATHS ${CMAKE_INSTALL_PREFIX}/lib
          ${CMAKE_INSTALL_PREFIX}/lib64
          /usr/local/lib
          /usr/local/lib64
          /usr/lib
          /usr/lib64
          )

include("${CMAKE_CURRENT_LIST_DIR}/gnuradio-lorawanTarget.cmake")

INCLUDE(FindPackageHandleStandardArgs)
FIND_PACKAGE_HANDLE_STANDARD_ARGS(GR_LORAWAN DEFAULT_MSG GR_LORAWAN_LIBRARIES GR_LORAWAN_INCLUDE_DIRS)
MARK_AS_ADVANCED(GR_LORAWAN_LIBRARIES GR_LORAWAN_INCLUDE_DIRS)
