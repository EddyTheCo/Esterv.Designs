cmake_minimum_required(VERSION 3.16)

project(Designs VERSION 0.1 LANGUAGES CXX)
set(CMAKE_AUTOMOC ON)
set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(Qt6 REQUIRED COMPONENTS Core Gui Quick)


qt_add_executable(app main.cpp)

qt6_add_qml_module(app
    URI  example_app
    VERSION 1.0
    QML_FILES
    window.qml
    RESOURCE_PREFIX
    "/esterVtech.com/imports"
)

target_link_libraries(app PUBLIC Qt6::Gui Qt6::Quick MyDesigns)


target_compile_definitions(app
    PRIVATE $<$<OR:$<CONFIG:Debug>,$<CONFIG:RelWithDebInfo>>:QT_QML_DEBUG>)

