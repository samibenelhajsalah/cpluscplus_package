cmake_minimum_required(VERSION 3.0)
add_compile_options(-O2)
project(monprojet)
#add_executable(monprojet main.cpp)

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

set(cpp_sources
    main.cpp
    boost_test.cpp)

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
