# Esterv.Controls

[TOC]

In this folder different custom Qt Quick Controls styles are listed.

The controls styles are created following [this](https://doc.qt.io/qt-6/qtquickcontrols-customize.html#creating-a-custom-style).

## Using the controls in your CMake project 

```CMake
target_link_libraries(<target> <PRIVATE|PUBLIC|INTERFACE> Esterv::FlatControl
$<$<STREQUAL:$<TARGET_PROPERTY:Esterv::FlatControl,TYPE>,STATIC_LIBRARY>:Esterv::FlatControlplugin>
)
```
## Using the controls

One needs to  make available to the QML engine the `Esterv.Controls.Flat` module by setting the [QML import path](https://doc.qt.io/qt-6/qtqml-syntax-imports.html#qml-import-path).

1. In your main function `engine.addImportPath("qrc:/esterVtech.com/imports");` to use the resource file. 

2. Set the environment variable like `export QML_IMPORT_PATH=installDir/CMAKE_INSTALL_LIBDIR`  where `CMAKE_INSTALL_LIBDIR` is where `Esterv` folder was created.

Then [select the style](https://doc.qt.io/qt-6/qtquickcontrols-styles.html#using-styles-in-qt-quick-controls) of your application like 
`./yourApp -style Esterv.Controls.Flat`

