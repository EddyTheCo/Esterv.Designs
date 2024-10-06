add_subdirectory(Flat)
if(CMAKE_PROJECT_NAME STREQUAL PROJECT_NAME)
  add_subdirectory(examples)
endif(CMAKE_PROJECT_NAME STREQUAL PROJECT_NAME)
