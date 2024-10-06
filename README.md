# Esterv.Designs

[TOC]

This repo produces QML modules with custom QML types that can be used in GUI interfaces.

It is composed of different Qt Quick Controls custom styles in the [Controls](Controls/README.md) directory.
Also, expose some higher-level custom controls/types in the [CustomControls](CustomControls/README.md) directory.
Some common resources are grouped in QML modules in the  [Styles](Styles/README.md) directory.


## Configure, build, test, package ...
 
The project uses [CMake presets](https://cmake.org/cmake/help/latest/manual/cmake-presets.7.html) as a way to share CMake configurations.
Refer to [cmake](https://cmake.org/cmake/help/latest/manual/cmake.1.html), [ctest](https://cmake.org/cmake/help/latest/manual/ctest.1.html) and [cpack](https://cmake.org/cmake/help/latest/manual/cpack.1.html) documentation for more information on the use of presets.


## Using the modules in your CMake project 

```CMake
include(FetchContent)
FetchContent_Declare(
	EstervDesigns
	GIT_REPOSITORY https://github.com/EddyTheCo/Esterv.Designs.git
	GIT_TAG vMAJOR.MINOR.PATCH 
	FIND_PACKAGE_ARGS MAJOR.MINOR COMPONENTS FlatControl CustomControls SimpleStyle CONFIG
	)
FetchContent_MakeAvailable(EstervDesigns)

target_link_libraries(<target> <PRIVATE|PUBLIC|INTERFACE> Esterv::SimpleStyle Esterv::CustomControls Esterv::FlatControl
$<$<STREQUAL:$<TARGET_PROPERTY:Esterv::SimpleStyle,TYPE>,STATIC_LIBRARY>:Esterv::SimpleStyleplugin>
$<$<STREQUAL:$<TARGET_PROPERTY:Esterv::CustomControls,TYPE>,STATIC_LIBRARY>:Esterv::CustomControlsplugin>
$<$<STREQUAL:$<TARGET_PROPERTY:Esterv::FlatControl,TYPE>,STATIC_LIBRARY>:Esterv::FlatControlplugin>
)
```
## Using the modules

One needs to  make available to the QML engine the different modules by setting the [QML import path](https://doc.qt.io/qt-6/qtqml-syntax-imports.html#qml-import-path).

1. In your main function `engine.addImportPath("qrc:/esterVtech.com/imports");` to use the resource file. 

2. Set the environment variable like `export QML_IMPORT_PATH=installDir/CMAKE_INSTALL_LIBDIR`  where `CMAKE_INSTALL_LIBDIR` is where `Esterv` folder was created.

## Examples

The [examples](examples) folder shows the use of the different custom types provided by the QML module.

One can also play with the types [Flat Controls](https://eddytheco.github.io/qmlonline/?example_url=flatcontrol)

## API reference

You can read the [API reference](https://eddytheco.github.io/Esterv.Designs/), or generate it yourself like
```
cmake --workflow --preset default-documentation
```


## Contributing

We appreciate any contribution!

You can open an issue or request a feature.
You can open a PR to the `develop` branch and the CI/CD will take care of the rest.
Make sure to acknowledge your work, and ideas when contributing.
