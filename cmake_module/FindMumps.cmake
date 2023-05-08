find_path(MUMPS_INCLUDE_DIR mumps_c.h PATH_SUFFIXES include)
#find_library(MUMPS_LIBRARY mumps)

if (MUMPS_INCLUDE_DIR )#AND MUMPS_LIBRARY)
    set(MUMPS_FOUND TRUE)
    message(STATUS "MUMPS_INCLUDE_DIR IS TRUE")
else()
    set(MUMPS_FOUND FALSE)
endif()

if (MUMPS_FOUND)
    if (NOT MUMPS_FIND_QUIETLY)
        #message(STATUS "Found MUMPS":)# ${MUMPS_LIBRARY}")
    endif()
else()
    if (MUMPS_FIND_REQUIRED)
        message(FATAL_ERROR "Could not find MUMPS library")
    endif()
endif()

set(MUMPS_INCLUDE_DIRS "${MUMPS_INCLUDE_DIR}")
message(MUMPS_INCLUDE_DIRS ${MUMPS_INCLUDE_DIRS})

set(SMUMPS_LIBRARY_DIRS /home/sami/Documents/travail/spack/opt/spack/linux-ubuntu22.04-ivybridge/gcc-11.3.0/mumps-5.5.1-pkmnh53e2xich4eko27xaqyrwrylt65p/lib)

find_library(Mumps_LIBRARY_s NAMES smumps HINTS ${SMUMPS_LIBRARY_DIRS} REQUIRED)
if (Mumps_LIBRARY_s)
    message(STATUS "Found libsmumps library: ${Mumps_LIBRARY_s}")
else()
    message(FATAL_ERROR "Could not find libsmumps library")
endif()

set(Mumps_LIBRARY_s "${Mumps_LIBRARY_s}")