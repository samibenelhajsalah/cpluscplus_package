set(MPI_LIBRARY_DIRS /home/sami/Documents/travail/spack/opt/spack/linux-ubuntu22.04-ivybridge/gcc-11.3.0/openmpi-4.1.4-um6gfja36iuzflbvulgwih4c5nclev2e/lib)


find_library(MPI_mpi_cxx_LIBRARY NAMES mpi_cxx HINTS ${MPI_LIBRARY_DIRS} REQUIRED)
if (MPI_mpi_cxx_LIBRARY)
    message(STATUS "Found libmpi_cxx library: ${MPI_mpi_cxx_LIBRARY}")
else()
    message(FATAL_ERROR "Could not find libmpi_xx library")
endif()

set(MPI_mpi_cxx_LIBRARY "${MPI_mpi_cxx_LIBRARY}")