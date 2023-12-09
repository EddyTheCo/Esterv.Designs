# EstervDesigns

This repo produces QML modules with custom QML types that can be used in GUI interfaces.

It is composed of different Qt Quick Controls custom styles in the [Controls](Controls/README.md) directory.
Also, expose some higher-level custom controls/types in the [CustomControls](CustomControls/README.md) directory.
Some common resources are grouped in QML modules in the  [Styles](Styles/README.md) directory.


## Installing the modules 

### From source code
```
git clone https://github.com/EddyTheCo/MyDesigns.git 

mkdir build
cd build
qt-cmake -G Ninja -DCMAKE_INSTALL_PREFIX=installDir -DCMAKE_BUILD_TYPE=Release -DQTDEPLOY=OFF -DBUILD_EXAMPLES=OFF -DBUILD_DOCS=OFF ../MyDesigns

cmake --build . 

cmake --install . 
```
where `installDir` is the installation path, `QTDEPLOY` install the examples and Qt dependencies using the  [cmake-deployment-api](https://www.qt.io/blog/cmake-deployment-api).
One can choose to build or not the example and the documentation with the `BUILD_EXAMPLES` and `BUILD_DOCS` variables.


### From GitHub releases
Download the releases from this repo. 

## Using the modules in your CMake project 

```CMake
include(FetchContent)
FetchContent_Declare(
	EstervDesigns
	GIT_REPOSITORY https://github.com/EddyTheCo/MyDesigns.git
	GIT_TAG v1.0.0 
	FIND_PACKAGE_ARGS 1.0  CONFIG
	)
FetchContent_MakeAvailable(EstervDesigns)

target_link_libraries(<target> <PRIVATE|PUBLIC|INTERFACE> EstervDesigns::SimpleStyle EstervDesigns::CustomControls EstervDesigns::FlatControl
$<$<STREQUAL:$<TARGET_PROPERTY:EstervDesigns::SimpleStyle,TYPE>,STATIC_LIBRARY>:EstervDesigns::SimpleStyleplugin>
$<$<STREQUAL:$<TARGET_PROPERTY:EstervDesigns::CustomControls,TYPE>,STATIC_LIBRARY>:EstervDesigns::CustomControlsplugin>
$<$<STREQUAL:$<TARGET_PROPERTY:EstervDesigns::FlatControl,TYPE>,STATIC_LIBRARY>:EstervDesigns::FlatControlplugin>
)
```
## Using the modules

One needs to  make available to the QML engine the different modules by setting the [QML import path](https://doc.qt.io/qt-6/qtqml-syntax-imports.html#qml-import-path).

1. In your main function `engine.addImportPath("qrc:/esterVtech.com/imports");` to use the resource file. 

2. Set the environment variable like `export QML_IMPORT_PATH=installDir/CMAKE_INSTALL_LIBDIR`  where `CMAKE_INSTALL_LIBDIR` is where `Esterv` folder was created.

## Examples

The [examples](examples) folder shows the use of the different custom types provided by the QML module.
One can also play with the types [here](https://eddytheco.github.io/qmlonline/?example_url=flatcontrol)


## Contributing

We appreciate any contribution!


You can open an issue or request a feature.
You can open a PR to the `develop` branch and the CI/CD will take care of the rest.
Make sure to acknowledge your work, and ideas when contributing.



