# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.22

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:

#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:

# Disable VCS-based implicit rules.
% : %,v

# Disable VCS-based implicit rules.
% : RCS/%

# Disable VCS-based implicit rules.
% : RCS/%,v

# Disable VCS-based implicit rules.
% : SCCS/s.%

# Disable VCS-based implicit rules.
% : s.%

.SUFFIXES: .hpux_make_needs_suffix_list

# Command-line flag to silence nested $(MAKE).
$(VERBOSE)MAKESILENT = -s

#Suppress display of executed commands.
$(VERBOSE).SILENT:

# A target that is always out of date.
cmake_force:
.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/joachim/Documents/gr-lorawan/lmic_sdr

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/joachim/Documents/gr-lorawan/lmic_sdr/build

# Include any dependencies generated for this target.
include CMakeFiles/myLib.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include CMakeFiles/myLib.dir/compiler_depend.make

# Include the progress variables for this target.
include CMakeFiles/myLib.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/myLib.dir/flags.make

CMakeFiles/myLib.dir/src/lmic/lmic.c.o: CMakeFiles/myLib.dir/flags.make
CMakeFiles/myLib.dir/src/lmic/lmic.c.o: ../src/lmic/lmic.c
CMakeFiles/myLib.dir/src/lmic/lmic.c.o: CMakeFiles/myLib.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/joachim/Documents/gr-lorawan/lmic_sdr/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object CMakeFiles/myLib.dir/src/lmic/lmic.c.o"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT CMakeFiles/myLib.dir/src/lmic/lmic.c.o -MF CMakeFiles/myLib.dir/src/lmic/lmic.c.o.d -o CMakeFiles/myLib.dir/src/lmic/lmic.c.o -c /home/joachim/Documents/gr-lorawan/lmic_sdr/src/lmic/lmic.c

CMakeFiles/myLib.dir/src/lmic/lmic.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/myLib.dir/src/lmic/lmic.c.i"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/joachim/Documents/gr-lorawan/lmic_sdr/src/lmic/lmic.c > CMakeFiles/myLib.dir/src/lmic/lmic.c.i

CMakeFiles/myLib.dir/src/lmic/lmic.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/myLib.dir/src/lmic/lmic.c.s"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/joachim/Documents/gr-lorawan/lmic_sdr/src/lmic/lmic.c -o CMakeFiles/myLib.dir/src/lmic/lmic.c.s

CMakeFiles/myLib.dir/src/lmic/oslmic.c.o: CMakeFiles/myLib.dir/flags.make
CMakeFiles/myLib.dir/src/lmic/oslmic.c.o: ../src/lmic/oslmic.c
CMakeFiles/myLib.dir/src/lmic/oslmic.c.o: CMakeFiles/myLib.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/joachim/Documents/gr-lorawan/lmic_sdr/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building C object CMakeFiles/myLib.dir/src/lmic/oslmic.c.o"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT CMakeFiles/myLib.dir/src/lmic/oslmic.c.o -MF CMakeFiles/myLib.dir/src/lmic/oslmic.c.o.d -o CMakeFiles/myLib.dir/src/lmic/oslmic.c.o -c /home/joachim/Documents/gr-lorawan/lmic_sdr/src/lmic/oslmic.c

CMakeFiles/myLib.dir/src/lmic/oslmic.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/myLib.dir/src/lmic/oslmic.c.i"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/joachim/Documents/gr-lorawan/lmic_sdr/src/lmic/oslmic.c > CMakeFiles/myLib.dir/src/lmic/oslmic.c.i

CMakeFiles/myLib.dir/src/lmic/oslmic.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/myLib.dir/src/lmic/oslmic.c.s"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/joachim/Documents/gr-lorawan/lmic_sdr/src/lmic/oslmic.c -o CMakeFiles/myLib.dir/src/lmic/oslmic.c.s

CMakeFiles/myLib.dir/src/lmic/radio.c.o: CMakeFiles/myLib.dir/flags.make
CMakeFiles/myLib.dir/src/lmic/radio.c.o: ../src/lmic/radio.c
CMakeFiles/myLib.dir/src/lmic/radio.c.o: CMakeFiles/myLib.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/joachim/Documents/gr-lorawan/lmic_sdr/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Building C object CMakeFiles/myLib.dir/src/lmic/radio.c.o"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT CMakeFiles/myLib.dir/src/lmic/radio.c.o -MF CMakeFiles/myLib.dir/src/lmic/radio.c.o.d -o CMakeFiles/myLib.dir/src/lmic/radio.c.o -c /home/joachim/Documents/gr-lorawan/lmic_sdr/src/lmic/radio.c

CMakeFiles/myLib.dir/src/lmic/radio.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/myLib.dir/src/lmic/radio.c.i"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/joachim/Documents/gr-lorawan/lmic_sdr/src/lmic/radio.c > CMakeFiles/myLib.dir/src/lmic/radio.c.i

CMakeFiles/myLib.dir/src/lmic/radio.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/myLib.dir/src/lmic/radio.c.s"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/joachim/Documents/gr-lorawan/lmic_sdr/src/lmic/radio.c -o CMakeFiles/myLib.dir/src/lmic/radio.c.s

CMakeFiles/myLib.dir/src/lmic/lmic_us_like.c.o: CMakeFiles/myLib.dir/flags.make
CMakeFiles/myLib.dir/src/lmic/lmic_us_like.c.o: ../src/lmic/lmic_us_like.c
CMakeFiles/myLib.dir/src/lmic/lmic_us_like.c.o: CMakeFiles/myLib.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/joachim/Documents/gr-lorawan/lmic_sdr/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Building C object CMakeFiles/myLib.dir/src/lmic/lmic_us_like.c.o"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT CMakeFiles/myLib.dir/src/lmic/lmic_us_like.c.o -MF CMakeFiles/myLib.dir/src/lmic/lmic_us_like.c.o.d -o CMakeFiles/myLib.dir/src/lmic/lmic_us_like.c.o -c /home/joachim/Documents/gr-lorawan/lmic_sdr/src/lmic/lmic_us_like.c

CMakeFiles/myLib.dir/src/lmic/lmic_us_like.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/myLib.dir/src/lmic/lmic_us_like.c.i"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/joachim/Documents/gr-lorawan/lmic_sdr/src/lmic/lmic_us_like.c > CMakeFiles/myLib.dir/src/lmic/lmic_us_like.c.i

CMakeFiles/myLib.dir/src/lmic/lmic_us_like.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/myLib.dir/src/lmic/lmic_us_like.c.s"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/joachim/Documents/gr-lorawan/lmic_sdr/src/lmic/lmic_us_like.c -o CMakeFiles/myLib.dir/src/lmic/lmic_us_like.c.s

CMakeFiles/myLib.dir/src/lmic/lmic_eu_like.c.o: CMakeFiles/myLib.dir/flags.make
CMakeFiles/myLib.dir/src/lmic/lmic_eu_like.c.o: ../src/lmic/lmic_eu_like.c
CMakeFiles/myLib.dir/src/lmic/lmic_eu_like.c.o: CMakeFiles/myLib.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/joachim/Documents/gr-lorawan/lmic_sdr/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_5) "Building C object CMakeFiles/myLib.dir/src/lmic/lmic_eu_like.c.o"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT CMakeFiles/myLib.dir/src/lmic/lmic_eu_like.c.o -MF CMakeFiles/myLib.dir/src/lmic/lmic_eu_like.c.o.d -o CMakeFiles/myLib.dir/src/lmic/lmic_eu_like.c.o -c /home/joachim/Documents/gr-lorawan/lmic_sdr/src/lmic/lmic_eu_like.c

CMakeFiles/myLib.dir/src/lmic/lmic_eu_like.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/myLib.dir/src/lmic/lmic_eu_like.c.i"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/joachim/Documents/gr-lorawan/lmic_sdr/src/lmic/lmic_eu_like.c > CMakeFiles/myLib.dir/src/lmic/lmic_eu_like.c.i

CMakeFiles/myLib.dir/src/lmic/lmic_eu_like.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/myLib.dir/src/lmic/lmic_eu_like.c.s"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/joachim/Documents/gr-lorawan/lmic_sdr/src/lmic/lmic_eu_like.c -o CMakeFiles/myLib.dir/src/lmic/lmic_eu_like.c.s

CMakeFiles/myLib.dir/src/aes/lmic.c.o: CMakeFiles/myLib.dir/flags.make
CMakeFiles/myLib.dir/src/aes/lmic.c.o: ../src/aes/lmic.c
CMakeFiles/myLib.dir/src/aes/lmic.c.o: CMakeFiles/myLib.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/joachim/Documents/gr-lorawan/lmic_sdr/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_6) "Building C object CMakeFiles/myLib.dir/src/aes/lmic.c.o"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT CMakeFiles/myLib.dir/src/aes/lmic.c.o -MF CMakeFiles/myLib.dir/src/aes/lmic.c.o.d -o CMakeFiles/myLib.dir/src/aes/lmic.c.o -c /home/joachim/Documents/gr-lorawan/lmic_sdr/src/aes/lmic.c

CMakeFiles/myLib.dir/src/aes/lmic.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/myLib.dir/src/aes/lmic.c.i"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/joachim/Documents/gr-lorawan/lmic_sdr/src/aes/lmic.c > CMakeFiles/myLib.dir/src/aes/lmic.c.i

CMakeFiles/myLib.dir/src/aes/lmic.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/myLib.dir/src/aes/lmic.c.s"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/joachim/Documents/gr-lorawan/lmic_sdr/src/aes/lmic.c -o CMakeFiles/myLib.dir/src/aes/lmic.c.s

CMakeFiles/myLib.dir/src/aes/other.c.o: CMakeFiles/myLib.dir/flags.make
CMakeFiles/myLib.dir/src/aes/other.c.o: ../src/aes/other.c
CMakeFiles/myLib.dir/src/aes/other.c.o: CMakeFiles/myLib.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/joachim/Documents/gr-lorawan/lmic_sdr/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_7) "Building C object CMakeFiles/myLib.dir/src/aes/other.c.o"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT CMakeFiles/myLib.dir/src/aes/other.c.o -MF CMakeFiles/myLib.dir/src/aes/other.c.o.d -o CMakeFiles/myLib.dir/src/aes/other.c.o -c /home/joachim/Documents/gr-lorawan/lmic_sdr/src/aes/other.c

CMakeFiles/myLib.dir/src/aes/other.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/myLib.dir/src/aes/other.c.i"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/joachim/Documents/gr-lorawan/lmic_sdr/src/aes/other.c > CMakeFiles/myLib.dir/src/aes/other.c.i

CMakeFiles/myLib.dir/src/aes/other.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/myLib.dir/src/aes/other.c.s"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/joachim/Documents/gr-lorawan/lmic_sdr/src/aes/other.c -o CMakeFiles/myLib.dir/src/aes/other.c.s

CMakeFiles/myLib.dir/src/aes/ideetron/AES-128_V10.cpp.o: CMakeFiles/myLib.dir/flags.make
CMakeFiles/myLib.dir/src/aes/ideetron/AES-128_V10.cpp.o: ../src/aes/ideetron/AES-128_V10.cpp
CMakeFiles/myLib.dir/src/aes/ideetron/AES-128_V10.cpp.o: CMakeFiles/myLib.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/joachim/Documents/gr-lorawan/lmic_sdr/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_8) "Building CXX object CMakeFiles/myLib.dir/src/aes/ideetron/AES-128_V10.cpp.o"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/myLib.dir/src/aes/ideetron/AES-128_V10.cpp.o -MF CMakeFiles/myLib.dir/src/aes/ideetron/AES-128_V10.cpp.o.d -o CMakeFiles/myLib.dir/src/aes/ideetron/AES-128_V10.cpp.o -c /home/joachim/Documents/gr-lorawan/lmic_sdr/src/aes/ideetron/AES-128_V10.cpp

CMakeFiles/myLib.dir/src/aes/ideetron/AES-128_V10.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/myLib.dir/src/aes/ideetron/AES-128_V10.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/joachim/Documents/gr-lorawan/lmic_sdr/src/aes/ideetron/AES-128_V10.cpp > CMakeFiles/myLib.dir/src/aes/ideetron/AES-128_V10.cpp.i

CMakeFiles/myLib.dir/src/aes/ideetron/AES-128_V10.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/myLib.dir/src/aes/ideetron/AES-128_V10.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/joachim/Documents/gr-lorawan/lmic_sdr/src/aes/ideetron/AES-128_V10.cpp -o CMakeFiles/myLib.dir/src/aes/ideetron/AES-128_V10.cpp.s

CMakeFiles/myLib.dir/src/hal/hal.cpp.o: CMakeFiles/myLib.dir/flags.make
CMakeFiles/myLib.dir/src/hal/hal.cpp.o: ../src/hal/hal.cpp
CMakeFiles/myLib.dir/src/hal/hal.cpp.o: CMakeFiles/myLib.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/joachim/Documents/gr-lorawan/lmic_sdr/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_9) "Building CXX object CMakeFiles/myLib.dir/src/hal/hal.cpp.o"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/myLib.dir/src/hal/hal.cpp.o -MF CMakeFiles/myLib.dir/src/hal/hal.cpp.o.d -o CMakeFiles/myLib.dir/src/hal/hal.cpp.o -c /home/joachim/Documents/gr-lorawan/lmic_sdr/src/hal/hal.cpp

CMakeFiles/myLib.dir/src/hal/hal.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/myLib.dir/src/hal/hal.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/joachim/Documents/gr-lorawan/lmic_sdr/src/hal/hal.cpp > CMakeFiles/myLib.dir/src/hal/hal.cpp.i

CMakeFiles/myLib.dir/src/hal/hal.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/myLib.dir/src/hal/hal.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/joachim/Documents/gr-lorawan/lmic_sdr/src/hal/hal.cpp -o CMakeFiles/myLib.dir/src/hal/hal.cpp.s

CMakeFiles/myLib.dir/src/lmic/lmic_us915.c.o: CMakeFiles/myLib.dir/flags.make
CMakeFiles/myLib.dir/src/lmic/lmic_us915.c.o: ../src/lmic/lmic_us915.c
CMakeFiles/myLib.dir/src/lmic/lmic_us915.c.o: CMakeFiles/myLib.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/joachim/Documents/gr-lorawan/lmic_sdr/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_10) "Building C object CMakeFiles/myLib.dir/src/lmic/lmic_us915.c.o"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT CMakeFiles/myLib.dir/src/lmic/lmic_us915.c.o -MF CMakeFiles/myLib.dir/src/lmic/lmic_us915.c.o.d -o CMakeFiles/myLib.dir/src/lmic/lmic_us915.c.o -c /home/joachim/Documents/gr-lorawan/lmic_sdr/src/lmic/lmic_us915.c

CMakeFiles/myLib.dir/src/lmic/lmic_us915.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/myLib.dir/src/lmic/lmic_us915.c.i"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/joachim/Documents/gr-lorawan/lmic_sdr/src/lmic/lmic_us915.c > CMakeFiles/myLib.dir/src/lmic/lmic_us915.c.i

CMakeFiles/myLib.dir/src/lmic/lmic_us915.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/myLib.dir/src/lmic/lmic_us915.c.s"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/joachim/Documents/gr-lorawan/lmic_sdr/src/lmic/lmic_us915.c -o CMakeFiles/myLib.dir/src/lmic/lmic_us915.c.s

CMakeFiles/myLib.dir/src/lmic/lmic_eu868.c.o: CMakeFiles/myLib.dir/flags.make
CMakeFiles/myLib.dir/src/lmic/lmic_eu868.c.o: ../src/lmic/lmic_eu868.c
CMakeFiles/myLib.dir/src/lmic/lmic_eu868.c.o: CMakeFiles/myLib.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/joachim/Documents/gr-lorawan/lmic_sdr/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_11) "Building C object CMakeFiles/myLib.dir/src/lmic/lmic_eu868.c.o"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT CMakeFiles/myLib.dir/src/lmic/lmic_eu868.c.o -MF CMakeFiles/myLib.dir/src/lmic/lmic_eu868.c.o.d -o CMakeFiles/myLib.dir/src/lmic/lmic_eu868.c.o -c /home/joachim/Documents/gr-lorawan/lmic_sdr/src/lmic/lmic_eu868.c

CMakeFiles/myLib.dir/src/lmic/lmic_eu868.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/myLib.dir/src/lmic/lmic_eu868.c.i"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/joachim/Documents/gr-lorawan/lmic_sdr/src/lmic/lmic_eu868.c > CMakeFiles/myLib.dir/src/lmic/lmic_eu868.c.i

CMakeFiles/myLib.dir/src/lmic/lmic_eu868.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/myLib.dir/src/lmic/lmic_eu868.c.s"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/joachim/Documents/gr-lorawan/lmic_sdr/src/lmic/lmic_eu868.c -o CMakeFiles/myLib.dir/src/lmic/lmic_eu868.c.s

CMakeFiles/myLib.dir/src/lmic/lmic_channelshuffle.c.o: CMakeFiles/myLib.dir/flags.make
CMakeFiles/myLib.dir/src/lmic/lmic_channelshuffle.c.o: ../src/lmic/lmic_channelshuffle.c
CMakeFiles/myLib.dir/src/lmic/lmic_channelshuffle.c.o: CMakeFiles/myLib.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/joachim/Documents/gr-lorawan/lmic_sdr/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_12) "Building C object CMakeFiles/myLib.dir/src/lmic/lmic_channelshuffle.c.o"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT CMakeFiles/myLib.dir/src/lmic/lmic_channelshuffle.c.o -MF CMakeFiles/myLib.dir/src/lmic/lmic_channelshuffle.c.o.d -o CMakeFiles/myLib.dir/src/lmic/lmic_channelshuffle.c.o -c /home/joachim/Documents/gr-lorawan/lmic_sdr/src/lmic/lmic_channelshuffle.c

CMakeFiles/myLib.dir/src/lmic/lmic_channelshuffle.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/myLib.dir/src/lmic/lmic_channelshuffle.c.i"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/joachim/Documents/gr-lorawan/lmic_sdr/src/lmic/lmic_channelshuffle.c > CMakeFiles/myLib.dir/src/lmic/lmic_channelshuffle.c.i

CMakeFiles/myLib.dir/src/lmic/lmic_channelshuffle.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/myLib.dir/src/lmic/lmic_channelshuffle.c.s"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/joachim/Documents/gr-lorawan/lmic_sdr/src/lmic/lmic_channelshuffle.c -o CMakeFiles/myLib.dir/src/lmic/lmic_channelshuffle.c.s

CMakeFiles/myLib.dir/src/loramac_tcp/loramac_tcp.c.o: CMakeFiles/myLib.dir/flags.make
CMakeFiles/myLib.dir/src/loramac_tcp/loramac_tcp.c.o: ../src/loramac_tcp/loramac_tcp.c
CMakeFiles/myLib.dir/src/loramac_tcp/loramac_tcp.c.o: CMakeFiles/myLib.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/joachim/Documents/gr-lorawan/lmic_sdr/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_13) "Building C object CMakeFiles/myLib.dir/src/loramac_tcp/loramac_tcp.c.o"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT CMakeFiles/myLib.dir/src/loramac_tcp/loramac_tcp.c.o -MF CMakeFiles/myLib.dir/src/loramac_tcp/loramac_tcp.c.o.d -o CMakeFiles/myLib.dir/src/loramac_tcp/loramac_tcp.c.o -c /home/joachim/Documents/gr-lorawan/lmic_sdr/src/loramac_tcp/loramac_tcp.c

CMakeFiles/myLib.dir/src/loramac_tcp/loramac_tcp.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/myLib.dir/src/loramac_tcp/loramac_tcp.c.i"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/joachim/Documents/gr-lorawan/lmic_sdr/src/loramac_tcp/loramac_tcp.c > CMakeFiles/myLib.dir/src/loramac_tcp/loramac_tcp.c.i

CMakeFiles/myLib.dir/src/loramac_tcp/loramac_tcp.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/myLib.dir/src/loramac_tcp/loramac_tcp.c.s"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/joachim/Documents/gr-lorawan/lmic_sdr/src/loramac_tcp/loramac_tcp.c -o CMakeFiles/myLib.dir/src/loramac_tcp/loramac_tcp.c.s

# Object files for target myLib
myLib_OBJECTS = \
"CMakeFiles/myLib.dir/src/lmic/lmic.c.o" \
"CMakeFiles/myLib.dir/src/lmic/oslmic.c.o" \
"CMakeFiles/myLib.dir/src/lmic/radio.c.o" \
"CMakeFiles/myLib.dir/src/lmic/lmic_us_like.c.o" \
"CMakeFiles/myLib.dir/src/lmic/lmic_eu_like.c.o" \
"CMakeFiles/myLib.dir/src/aes/lmic.c.o" \
"CMakeFiles/myLib.dir/src/aes/other.c.o" \
"CMakeFiles/myLib.dir/src/aes/ideetron/AES-128_V10.cpp.o" \
"CMakeFiles/myLib.dir/src/hal/hal.cpp.o" \
"CMakeFiles/myLib.dir/src/lmic/lmic_us915.c.o" \
"CMakeFiles/myLib.dir/src/lmic/lmic_eu868.c.o" \
"CMakeFiles/myLib.dir/src/lmic/lmic_channelshuffle.c.o" \
"CMakeFiles/myLib.dir/src/loramac_tcp/loramac_tcp.c.o"

# External object files for target myLib
myLib_EXTERNAL_OBJECTS =

libmyLib.a: CMakeFiles/myLib.dir/src/lmic/lmic.c.o
libmyLib.a: CMakeFiles/myLib.dir/src/lmic/oslmic.c.o
libmyLib.a: CMakeFiles/myLib.dir/src/lmic/radio.c.o
libmyLib.a: CMakeFiles/myLib.dir/src/lmic/lmic_us_like.c.o
libmyLib.a: CMakeFiles/myLib.dir/src/lmic/lmic_eu_like.c.o
libmyLib.a: CMakeFiles/myLib.dir/src/aes/lmic.c.o
libmyLib.a: CMakeFiles/myLib.dir/src/aes/other.c.o
libmyLib.a: CMakeFiles/myLib.dir/src/aes/ideetron/AES-128_V10.cpp.o
libmyLib.a: CMakeFiles/myLib.dir/src/hal/hal.cpp.o
libmyLib.a: CMakeFiles/myLib.dir/src/lmic/lmic_us915.c.o
libmyLib.a: CMakeFiles/myLib.dir/src/lmic/lmic_eu868.c.o
libmyLib.a: CMakeFiles/myLib.dir/src/lmic/lmic_channelshuffle.c.o
libmyLib.a: CMakeFiles/myLib.dir/src/loramac_tcp/loramac_tcp.c.o
libmyLib.a: CMakeFiles/myLib.dir/build.make
libmyLib.a: CMakeFiles/myLib.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/joachim/Documents/gr-lorawan/lmic_sdr/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_14) "Linking CXX static library libmyLib.a"
	$(CMAKE_COMMAND) -P CMakeFiles/myLib.dir/cmake_clean_target.cmake
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/myLib.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/myLib.dir/build: libmyLib.a
.PHONY : CMakeFiles/myLib.dir/build

CMakeFiles/myLib.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/myLib.dir/cmake_clean.cmake
.PHONY : CMakeFiles/myLib.dir/clean

CMakeFiles/myLib.dir/depend:
	cd /home/joachim/Documents/gr-lorawan/lmic_sdr/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/joachim/Documents/gr-lorawan/lmic_sdr /home/joachim/Documents/gr-lorawan/lmic_sdr /home/joachim/Documents/gr-lorawan/lmic_sdr/build /home/joachim/Documents/gr-lorawan/lmic_sdr/build /home/joachim/Documents/gr-lorawan/lmic_sdr/build/CMakeFiles/myLib.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/myLib.dir/depend

