# Esterv.Styles 

[TOC]

In this folder different resources that are commonly used in GUI are listed.
The different folders creates different QML modules grouping this resources. 

## Using the modules in your CMake project 

```CMake
target_link_libraries(<target> <PRIVATE|PUBLIC|INTERFACE> Esterv::SimpleStyle
$<$<STREQUAL:$<TARGET_PROPERTY:Esterv::SimpleStyle,TYPE>,STATIC_LIBRARY>:Esterv::SimpleStyleplugin>
)
```
## Using the modules

One needs to  make available to the QML engine the `Esterv.Controls.Flat` module by setting the [QML import path](https://doc.qt.io/qt-6/qtqml-syntax-imports.html#qml-import-path).

1. In your main function `engine.addImportPath("qrc:/esterVtech.com/imports");` to use the resource file. 

2. Set the environment variable like `export QML_IMPORT_PATH=installDir/CMAKE_INSTALL_LIBDIR`  where `CMAKE_INSTALL_LIBDIR` is where `Esterv` folder was created.

