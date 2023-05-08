cmake_minimum_required(VERSION 3.0)
add_compile_options(-O2)
project(monprojet)
#add_executable(monprojet main.cpp)

#
# Eigen3
#
#find_package(Eigen3 3.4.0)
SET(EIGEN3_INCLUDE_DIR "$ENV{EIGEN3_INCLUDE_DIR}")
IF (NOT EIGEN3_INCLUDE_DIR)
    MESSAGE(FATAL_ERROR "Please point the environment variable EIGEN3_INCLUDE_DIR
                        to the include directory of your Eigen3 installation.")
ENDIF ()
INCLUDE_DIRECTORIES("${EIGEN3_INCLUDE_DIR}")
# DISABLE OpenMP multithreading if it's enable inside EIGEN
add_definitions(-DEIGEN_DONT_PARALLELIZE)
message(
        STATUS "\n-------------------------------------------------------")

message(STATUS "EIGEN3 . INCLUDE : ${EIGEN3_INCLUDE_DIR}")

#find_package(Sphinx)
find_program(SPHINX_EXECUTABLE sphinx-build)
if (SPHINX_EXECUTABLE)
  set(SPHINX_FOUND TRUE)
endif()

if (SPHINX_FOUND)
  message(STATUS "Found Sphinx: ${SPHINX_EXECUTABLE}")
else()
  message(STATUS "Sphinx not found.")
endif()

include(FindPackageHandleStandardArgs)
find_package_handle_standard_args(Sphinx DEFAULT_MSG SPHINX_EXECUTABLE)
FIND_PROGRAM(SPHINX_EXE NAMES sphinx-build)
find_package(Boost 1.80.0 REQUIRED COMPONENTS unit_test_framework)

#include(CheckSymbolExists)



#find_package(Mumps 5.5.1 REQUIRED)
# Recherche Mumps
#find_package(Mumps REQUIRED)


# Inclure les fichiers de Mumps
#include_directories(${MUMPS_INCLUDE_DIRS})
#link_directories(${MUMPS_LIBRARY_DIRS})

#find_package(MPI REQUIRED)



set(cpp_sources
    main.cpp
    boost_test.cpp
    eigen.cpp)

foreach(cpp_file ${cpp_sources})
  # Obtient le nom du fichier source sans l'extension
  get_filename_component(EXECUTABLE_NAME ${cpp_file} NAME_WE)
  add_executable(${EXECUTABLE_NAME} ${cpp_file})
  target_link_libraries(${EXECUTABLE_NAME} PUBLIC Boost::unit_test_framework)
endforeach(cpp_file)
#add_subdirectory(doc)
#cmake_minimum_required(VERSION 3.5)
#project(mon_projet)

# Spécifier le fichier source
#set(SOURCES
#    main.cpp
#)

# Créer une cible exécutable pour le projet
#add_executable(main ${PROJECT_NAME} ${SOURCES})

# Création du dossier tests
file(MAKE_DIRECTORY "${CMAKE_CURRENT_SOURCE_DIR}/../tests")
message(STATUS "CMAKE_CURRENT_SOURCE_DIR: ${CMAKE_CURRENT_SOURCE_DIR}")
add_subdirectory("tests" "${CMAKE_CURRENT_SOURCE_DIR}/tests")

message(STATUS "Répertoire binaire courant: ${CMAKE_CURRENT_BINARY_DIR}")


#get_filename_component (PROJECT_PATH "${PROJECT_SOURCE_DIR}" ABSOLUTE CACHE)
#message(STATUS "Répertoire PROJECT_PATH}: ${PROJECT_PATH}}")
#list( PREPEND CMAKE_MODULE_PATH  ${PROJECT_PATH}/cmake_module)
#add_subdirectory(${CMAKE_MODULE_PATH})

list(APPEND CMAKE_MODULE_PATH "${CMAKE_SOURCE_DIR}/cmake_module")
find_package(Mumps REQUIRED)