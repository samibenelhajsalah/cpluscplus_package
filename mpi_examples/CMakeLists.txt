
# Recherche OpenMPI
find_package(MPI REQUIRED)

# Ajout des fichiers sources de l'application
add_executable(mpi_example_1 mpi_example_1.cpp)

include_directories(/home/sami/Documents/travail/spack/opt/spack/linux-ubuntu22.04-ivybridge/gcc-11.3.0/openmpi-4.1.4-um6gfja36iuzflbvulgwih4c5nclev2e/include)
# Définition des chemins d'inclusions
#include_directories(${MPI_INCLUDE_PATH})

# Lien avec OpenMPI
target_link_libraries(mpi_example_1 ${MPI_mpi_cxx_LIBRARY} ${MPI_mpi_LIBRARY} ${MPI_LIBRARIES})

# Définition des flags de compilation
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} ${MPI_COMPILE_FLAGS}")

# Définition des flags de lien
set(CMAKE_EXE_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS} ${MPI_LINK_FLAGS}")



