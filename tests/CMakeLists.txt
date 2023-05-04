set(cpp_sources
    boost_test_2.cpp
    boost_test_1.cpp
    )

enable_testing()
foreach(cpp_file ${cpp_sources})
  # Obtient le nom du fichier source sans l'extension
  get_filename_component(test_name ${cpp_file} NAME_WE)
  add_executable(${test_name} ${cpp_file})
  target_link_libraries(${test_name} PUBLIC Boost::unit_test_framework)
  add_test(NAME ${test_name} COMMAND ${test_name})
endforeach(cpp_file)
