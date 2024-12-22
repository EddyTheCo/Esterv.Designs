# Esterv.CustomControls

[TOC]

This folder produce a QML module with custom types,
simple reusable types.
These controls are higher level than the Quick Controls, so they have to be separated from them.

## Using the custom controls in your CMake project 

```CMake
target_link_libraries(<target> <PRIVATE|PUBLIC|INTERFACE> Esterv::CustomControls
$<$<STREQUAL:$<TARGET_PROPERTY:Esterv::CustomControls,TYPE>,STATIC_LIBRARY>:Esterv::CustomControlsplugin>
)
```
## Using the custom controls

One needs to  make available to the QML engine the `Esterv.CustomControls` module by setting the [QML import path](https://doc.qt.io/qt-6/qtqml-syntax-imports.html#qml-import-path).

1. In your main function `engine.addImportPath("qrc:/esterVtech.com/imports");` to use the resource file. 

2. Set the environment variable like `export QML_IMPORT_PATH=installDir/CMAKE_INSTALL_LIBDIR`  where `CMAKE_INSTALL_LIBDIR` is where `Esterv` folder was created.

