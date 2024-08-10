add_library(AboutThis include/about.hpp src/about.cpp)
target_link_libraries(AboutThis PUBLIC Qt6::Core)

qt6_add_qml_module(
  CustomControls
  URI
  Esterv.CustomControls
  VERSION
  1.0
  QML_FILES
  "qml/PrevButton.qml"
  "qml/NextButton.qml"
  "qml/ThemeSwitch.qml"
  "qml/CloseButton.qml"
  "qml/PinPad.qml"
  "qml/About.qml"
  SOURCES
  "include/about.hpp"
  "src/about.cpp"
  RESOURCE_PREFIX
  "/esterVtech.com/imports"
  OUTPUT_TARGETS
  out_targets_var
  OUTPUT_DIRECTORY
  ${CMAKE_BINARY_DIR}/Esterv/CustomControls
  IMPORT_PATH
  ${CMAKE_BINARY_DIR})

target_compile_definitions(CustomControls PRIVATE USE_QML)
foreach(target "AboutThis" "CustomControls")
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

add_library(Esterv::CustomControlsplugin ALIAS CustomControlsplugin)

target_link_libraries(CustomControls PUBLIC Qt6::Gui Qt6::Quick SimpleStyle)

install(
  TARGETS CustomControls ${out_targets_var}
  EXPORT ${PROJECT_NAME}-config
  DESTINATION ${CMAKE_INSTALL_LIBDIR}
  COMPONENT EstervCustomControls
  RUNTIME DESTINATION "${CMAKE_INSTALL_BINDIR}" COMPONENT EstervCustomControls)
install(
  TARGETS AboutThis
  COMPONENT EstervAboutThis-cli
  BUNDLE DESTINATION . COMPONENT EstervAboutThis-cli)
install(
  DIRECTORY ${CMAKE_BINARY_DIR}/Esterv/CustomControls
  DESTINATION ${CMAKE_INSTALL_LIBDIR}/Esterv
  COMPONENT EstervCustomControls-qml)
install(
  TARGETS CustomControlsplugin
  EXPORT ${PROJECT_NAME}-config
  DESTINATION ${CMAKE_INSTALL_LIBDIR}/Esterv/CustomControls
  COMPONENT EstervCustomControls-qml
  RUNTIME DESTINATION "${CMAKE_INSTALL_BINDIR}"
          COMPONENT EstervCustomControls-qml)
