set_source_files_properties(qml/Style.qml PROPERTIES QT_QML_SINGLETON_TYPE TRUE)
qt6_add_qml_module(
  SimpleStyle
  URI
  Esterv.Styles.Simple
  VERSION
  1.0
  QML_FILES
  qml/Style.qml
  RESOURCE_PREFIX
  "/esterVtech.com/imports"
  OUTPUT_TARGETS
  out_targets_var
  OUTPUT_DIRECTORY
  ${CMAKE_BINARY_DIR}/Esterv/Styles/Simple
  IMPORT_PATH
  ${CMAKE_BINARY_DIR})
add_library(Esterv::SimpleStyle ALIAS SimpleStyle)
set_target_properties(SimpleStyle PROPERTIES VERSION ${VERSION}
                                             SOVERSION ${VERSION_MAJOR})
add_library(Esterv::SimpleStyleplugin ALIAS SimpleStyleplugin)
qt6_add_shaders(
  SimpleStyle
  "esterVtech.com.imports.Styles.Simple"
  BATCHABLE
  PRECOMPILE
  OPTIMIZED
  OUTPUT_TARGETS
  out_targets_var2
  PREFIX
  "/esterVtech.com/imports/Designs"
  FILES
  "frag/hollowArrowHead.frag"
  "frag/filledArrowHead.frag"
  "frag/sunTomoon.frag"
  "frag/close.frag")

target_link_libraries(SimpleStyle PUBLIC Qt6::Gui Qt6::Quick)

install(
  TARGETS SimpleStyle ${out_targets_var} ${out_targets_var2}
  EXPORT ${PROJECT_NAME}-config
  COMPONENT EstervSimpleStyle
  ARCHIVE COMPONENT ${PROJECT_NAME}-dev)
install(
  DIRECTORY ${CMAKE_BINARY_DIR}/Esterv/Styles/Simple
  DESTINATION ${CMAKE_INSTALL_LIBDIR}/Esterv/Styles
  COMPONENT EstervSimpleStyle-qml)
install(
  TARGETS SimpleStyleplugin
  EXPORT ${PROJECT_NAME}-config
  DESTINATION ${CMAKE_INSTALL_LIBDIR}/Esterv/Styles/Simple
  COMPONENT EstervSimpleStyle-qml
  ARCHIVE COMPONENT ${PROJECT_NAME}-dev)
