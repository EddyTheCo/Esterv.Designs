cmake_minimum_required(VERSION 3.24)
include(${CMAKE_CURRENT_BINARY_DIR}/local_conf.cmake OPTIONAL)
include(FetchContent)
FetchContent_Declare(
  ccommon
  GIT_REPOSITORY https://github.com/EddyTheCo/Common.git
  GIT_TAG v0.4.1)
FetchContent_MakeAvailable(ccommon)
version_from_git(LOG OFF TIMESTAMP "%Y%m%d%H%M%S")
project(
  EstervDesigns
  VERSION ${VERSION}
  LANGUAGES CXX)

set_property(GLOBAL PROPERTY USE_FOLDERS ON)
set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_EXTENSIONS OFF)
set(CMAKE_WINDOWS_EXPORT_ALL_SYMBOLS ON)
include(GNUInstallDirs)

find_package(
  Qt6
  COMPONENTS Core Gui Quick Qml
  OPTIONAL_COMPONENTS ShaderTools)

if(Qt6_FOUND)
  qt_standard_project_setup()
  if(NOT TARGET Qt6::ShaderTools)
    FetchContent_Declare(
      qtshadertools
      GIT_REPOSITORY https://github.com/qt/qtshadertools.git
      GIT_TAG 6.6.0)
    FetchContent_MakeAvailable(qtshadertools)
  endif()

  add_subdirectory(Styles)
  add_subdirectory(Controls)
  add_subdirectory(CustomControls)

  build_exports()
  if(CMAKE_PROJECT_NAME STREQUAL PROJECT_NAME)
    add_subdirectory(examples)
    build_cpack()
  endif()
else()
  message(STATUS "${PROJECT_NAME}" will not be build)
endif(Qt6_FOUND)

if(BUILD_DOCS)
  build_docs()
endif(BUILD_DOCS)
