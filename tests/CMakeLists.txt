set(cpp_sources
    main1.cpp
    )

foreach(cpp_file ${cpp_sources})
  # Obtient le nom du fichier source sans l'extension
  get_filename_component(EXECUTABLE_NAME ${cpp_file} NAME_WE)
  add_executable(${EXECUTABLE_NAME} ${cpp_file})
  target_link_libraries(${EXECUTABLE_NAME} PUBLIC Boost::unit_test_framework)
endforeach(cpp_file)
