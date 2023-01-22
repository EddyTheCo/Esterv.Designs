cmake_minimum_required(VERSION 3.16)

project(IOTA VERSION 0.1 LANGUAGES CXX)
set(CMAKE_AUTOMOC ON)
set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(Qt6 REQUIRED COMPONENTS Core Gui Quick)


qt6_add_qml_module(MyDesigns
	URI  MyDesigns
    VERSION 1.0
    OUTPUT_TARGETS out_targets_var
    QML_FILES
    qml/MyTextField.qml
    qml/MyFrame.qml
    qml/MyButton.qml
)

target_link_libraries(MyDesigns PUBLIC Qt6::Gui Qt6::Quick)

install(TARGETS MyDesigns ${out_targets_var} EXPORT MyDesignsTargets DESTINATION bin)

#if(EMSCRIPTEN)
#install(TARGETS MyDesigns_qmlcache MyDesigns_resources_2 MyDesigns_resources_1  EXPORT MyDesignsTargets DESTINATION bin )
#endif()

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
