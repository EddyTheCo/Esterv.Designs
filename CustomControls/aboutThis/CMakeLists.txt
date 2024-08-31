add_library(about${CMAKE_PROJECT_NAME}-cli include/about.hpp about.cpp)
target_link_libraries(about${CMAKE_PROJECT_NAME}-cli PUBLIC Qt6::Core)

set(IMPORT_NAME Esterv.About${CMAKE_PROJECT_NAME})
configure_file(${CMAKE_CURRENT_SOURCE_DIR}/About.qml.in
               ${CMAKE_CURRENT_SOURCE_DIR}/qml/About.qml)

qt6_add_qml_module(
  About${CMAKE_PROJECT_NAME}
  URI
  Esterv.About${CMAKE_PROJECT_NAME}
  VERSION
  1.0
  QML_FILES
  "qml/About.qml"
  SOURCES
  "include/about.hpp"
  "about.cpp"
  RESOURCE_PREFIX
  "/esterVtech.com/imports"
  OUTPUT_TARGETS
  out_targets_var
  OUTPUT_DIRECTORY
  ${CMAKE_BINARY_DIR}/Esterv/About${CMAKE_PROJECT_NAME}
  IMPORT_PATH
  ${CMAKE_BINARY_DIR})

target_compile_definitions(About${CMAKE_PROJECT_NAME} PRIVATE USE_QML)
foreach(target "about${CMAKE_PROJECT_NAME}-cli" "About${CMAKE_PROJECT_NAME}")
  target_compile_definitions(
    ${target} PRIVATE CMAKE_PROJECT_VERSION="${CMAKE_PROJECT_VERSION}")
  target_compile_definitions(${target}
                             PRIVATE CMAKE_PROJECT_NAME="${CMAKE_PROJECT_NAME}")
  target_compile_definitions(
    ${target}
    PRIVATE
      CMAKE_ARCH="${CMAKE_CXX_COMPILER_ID} ${CMAKE_CXX_COMPILER_VERSION} \(${CMAKE_SYSTEM_NAME} ${CMAKE_SYSTEM_VERSION}\),${CMAKE_SYSTEM_PROCESSOR}"
  )
  target_include_directories(
    ${target} PUBLIC $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
                     "$<INSTALL_INTERFACE:${CMAKE_INSTALL_INCLUDEDIR}/Esterv/>")
  target_compile_definitions(${target} PRIVATE WINDOWS_ABOUT)
  set_target_properties(${target} PROPERTIES VERSION ${VERSION}
                                             SOVERSION ${VERSION_MAJOR})
  add_library(Esterv::${target} ALIAS ${target})
endforeach()

add_library(Esterv::About${CMAKE_PROJECT_NAME}plugin ALIAS
            About${CMAKE_PROJECT_NAME}plugin)

install(
  TARGETS About${CMAKE_PROJECT_NAME} ${out_targets_var}
  EXPORT ${PROJECT_NAME}-config
  DESTINATION ${CMAKE_INSTALL_LIBDIR}
  COMPONENT EstervAbout${CMAKE_PROJECT_NAME}
  RUNTIME DESTINATION "${CMAKE_INSTALL_BINDIR}"
          COMPONENT EstervAbout${CMAKE_PROJECT_NAME})
install(
  TARGETS about${CMAKE_PROJECT_NAME}-cli
  COMPONENT Estervabout${CMAKE_PROJECT_NAME}-cli
  BUNDLE DESTINATION . COMPONENT Estervabout${CMAKE_PROJECT_NAME}-cli)
install(
  DIRECTORY ${CMAKE_BINARY_DIR}/Esterv/About${CMAKE_PROJECT_NAME}
  DESTINATION ${CMAKE_INSTALL_LIBDIR}/Esterv
  COMPONENT EstervAbout${CMAKE_PROJECT_NAME}-qml)
install(
  TARGETS About${CMAKE_PROJECT_NAME}plugin
  EXPORT ${PROJECT_NAME}-config
  DESTINATION ${CMAKE_INSTALL_LIBDIR}/Esterv/About${CMAKE_PROJECT_NAME}
  COMPONENT EstervAbout${CMAKE_PROJECT_NAME}-qml
  RUNTIME DESTINATION "${CMAKE_INSTALL_BINDIR}"
          COMPONENT EstervAbout${CMAKE_PROJECT_NAME}-qml)
