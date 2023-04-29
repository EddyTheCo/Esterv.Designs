cmake_minimum_required(VERSION 3.16)

project(Designs VERSION 0.1 LANGUAGES CXX)
set(CMAKE_AUTOMOC ON)
set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(Qt6 COMPONENTS Core)
find_package(Qt6 COMPONENTS Gui)
find_package(Qt6 COMPONENTS Quick)
find_package(Qt6 COMPONENTS Qml)
find_package(Qt6 COMPONENTS ShaderTools)



qt6_add_qml_module(MyDesigns
    URI  MyDesigns
    VERSION 1.0
    OUTPUT_TARGETS out_targets_var
    QML_FILES
    qml/MyTextField.qml
    qml/MyTextArea.qml
    qml/MyFrame.qml
    qml/MyButton.qml
    qml/MyLabel.qml
    qml/MyAddressQr.qml
    qml/MyPayPopUp.qml
    qml/MyRadioButton.qml
    qml/MyCheckBox.qml
    qml/MySettButton.qml
    qml/ArrowShadder.qml
    qml/Notification.qml
    RESOURCE_PREFIX
     "/esterVtech.com/imports"
    NO_IMPORT_SCAN
    OUTPUT_DIRECTORY
    ${CMAKE_CURRENT_BINARY_DIR}/MyDesigns
)



qt6_add_shaders(MyDesigns "esterVtech.com.imports.MyDesigns.shaders"
    BATCHABLE
    PRECOMPILE
    OPTIMIZED
    OUTPUT_TARGETS out_targets_var2
    PREFIX
    "/esterVtech.com/imports/MyDesigns"
    FILES
    "frag/mySettButton.frag"
    "frag/arrowHead.frag"
)



target_link_libraries(MyDesigns PUBLIC Qt6::Gui Qt6::Quick)

install(TARGETS MyDesigns ${out_targets_var}  ${out_targets_var2} EXPORT MyDesignsTargets DESTINATION bin)


install(EXPORT MyDesignsTargets
    FILE MyDesignsTargets.cmake
    DESTINATION lib/cmake/MyDesigns
)
include(CMakePackageConfigHelpers)
# generate the config file that is includes the exports
configure_package_config_file(${CMAKE_CURRENT_SOURCE_DIR}/Config.cmake.in
    "${CMAKE_CURRENT_BINARY_DIR}/MyDesignsConfig.cmake"
    INSTALL_DESTINATION "lib/cmake/MyDesigns"
    NO_SET_AND_CHECK_MACRO
    NO_CHECK_REQUIRED_COMPONENTS_MACRO
)
write_basic_package_version_file(
    "${CMAKE_CURRENT_BINARY_DIR}/MyDesignsConfigVersion.cmake"
    VERSION "0.1.1.0"
    COMPATIBILITY AnyNewerVersion
)
install(FILES
    ${CMAKE_CURRENT_BINARY_DIR}/MyDesignsConfig.cmake
    ${CMAKE_CURRENT_BINARY_DIR}/MyDesignsConfigVersion.cmake
    DESTINATION lib/cmake/MyDesigns
)
export(EXPORT MyDesignsTargets
    FILE "${CMAKE_CURRENT_BINARY_DIR}/MyDesignsTargets.cmake"
)

list(APPEND QML_IMPORT_PATH ${CMAKE_CURRENT_SOURCE_DIR}/qml ${CMAKE_CURRENT_BINARY_DIR}/)
set(QML_IMPORT_PATH ${QML_IMPORT_PATH} CACHE STRING "" FORCE)

if(CMAKE_PROJECT_NAME STREQUAL PROJECT_NAME)
    add_subdirectory(examples)
endif()
