cmake_minimum_required(VERSION 3.24)

option(BUILD_STYLES "Build Styles part" ON)
option(BUILD_CONTROLS "Build Controls part" ON)
option(BUILD_CUSTOM_CONTROLS "Build Custom Controls part" ON)
option(BUILD_EXAMPLES "Build Examples" OFF)

include(${CMAKE_CURRENT_BINARY_DIR}/local_conf.cmake OPTIONAL)
include(FetchContent)
FetchContent_Declare(
  ccommon
  GIT_REPOSITORY https://github.com/EddyTheCo/Common.git
  GIT_TAG v0.5.0)
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

  if(BUILD_STYLES)
    add_subdirectory(Styles)
  endif(BUILD_STYLES)
  if(BUILD_CONTROLS)
    add_subdirectory(Controls)
  endif(BUILD_CONTROLS)
  if(BUILD_CUSTOM_CONTROLS)
    add_subdirectory(CustomControls)
  endif(BUILD_CUSTOM_CONTROLS)

  set(SET_COMPONENTS "")
  foreach(component "FlatControl" "SimpleStyle" "CustomControls")
    if(TARGET "${component}")
      string(APPEND SET_COMPONENTS
             "set(${PROJECT_NAME}_${component}_FOUND \"ON\")\n")
    endif()
  endforeach()

  build_exports()
  if(CMAKE_PROJECT_NAME STREQUAL PROJECT_NAME)
    build_cpack()
  endif(CMAKE_PROJECT_NAME STREQUAL PROJECT_NAME)
else()
  message(STATUS "${PROJECT_NAME} will not be built")
endif(Qt6_FOUND)

if(BUILD_DOCS)
  build_docs()
endif(BUILD_DOCS)
