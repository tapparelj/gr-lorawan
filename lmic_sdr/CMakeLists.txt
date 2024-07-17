cmake_minimum_required(VERSION 3.10)
project(lorawan VERSION 1.0)


# Define the include directories
include_directories(src)

set(SOURCES
    src/lmic/lmic.c
    src/lmic/oslmic.c
    src/lmic/radio.c
    src/lmic/lmic_us_like.c
    src/lmic/lmic_eu_like.c
    src/aes/lmic.c
    src/aes/other.c
    src/aes/ideetron/AES-128_V10.cpp
    src/hal/hal.cpp
    src/lmic/lmic_us915.c
    src/lmic/lmic_eu868.c
    src/lmic/lmic_channelshuffle.c
    src/loramac_tcp/loramac_tcp.c
)

add_library(lorawanLib ${SOURCES})

# Add the executable and the source files
add_executable(lorawan main.cpp ${SOURCES})

target_link_libraries(lorawan PUBLIC lorawanLib)


# Set the C++ standard to 17
# set_property(TARGET lorawan PROPERTY CXX_STANDARD 17)

# If you have additional libraries to link, add them here
# target_link_libraries(lorawan PUBLIC library1 library2 ...)

# If you have external dependencies, you might include additional configurations here
# find_package(externallibrary REQUIRED)
# target_link_libraries(hello PUBLIC externallibrary)