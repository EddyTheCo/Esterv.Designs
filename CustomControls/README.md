# Esterv.CustomControls

This folder produce a QML module with custom types,
simple reusable types.
This controls are higher level that the Quick Controls, so they have to be separated from them.

## Installing the custom controls

### From source code
```
git clone https://github.com/EddyTheCo/MyDesigns.git 

mkdir build
cd build
qt-cmake -G Ninja -DCMAKE_INSTALL_PREFIX=installDir -DCMAKE_BUILD_TYPE=Release -DQTDEPLOY=OFF -DBUILD_EXAMPLES=OFF -DBUILD_DOCS=OFF ../MyDesigns

cmake --build . 

cmake --install . --component CustomControls
```
where `installDir` is the installation path.

### From GitHub releases
Download the releases from this repo. 

## Using the custom controls in your CMake project 

```CMake
include(FetchContent)
FetchContent_Declare(
	EstervDesigns
	GIT_REPOSITORY https://github.com/EddyTheCo/MyDesigns.git
	GIT_TAG vMAJOR.MINOR.PATCH 
	FIND_PACKAGE_ARGS MAJOR.MINOR  COMPONENTS CustomControls CONFIG
	)
FetchContent_MakeAvailable(EstervDesigns)

target_link_libraries(<target> <PRIVATE|PUBLIC|INTERFACE> EstervDesigns::CustomControls
$<$<STREQUAL:$<TARGET_PROPERTY:EstervDesigns::CustomControls,TYPE>,STATIC_LIBRARY>:EstervDesigns::CustomControlsplugin>
)
```
## Using the custom controls

One needs to  make available to the QML engine the `Esterv.CustomControls` module by setting the [QML import path](https://doc.qt.io/qt-6/qtqml-syntax-imports.html#qml-import-path).

1. In your main function `engine.addImportPath("qrc:/esterVtech.com/imports");` to use the resource file. 

2. Set the environment variable like `export QML_IMPORT_PATH=installDir/CMAKE_INSTALL_LIBDIR`  where `CMAKE_INSTALL_LIBDIR` is where `Esterv` folder was created.

