# Esterv.Controls

In this folder different custom Qt Quick Controls styles are listed.

The controls styles are created following [this](https://doc.qt.io/qt-6/qtquickcontrols-customize.html#creating-a-custom-style).

## Installing the controls

### From source code
```
git clone https://github.com/EddyTheCo/MyDesigns.git 

mkdir build
cd build
qt-cmake -G Ninja -DCMAKE_INSTALL_PREFIX=installDir -DCMAKE_BUILD_TYPE=Release -DQTDEPLOY=OFF -DBUILD_EXAMPLES=OFF -DBUILD_DOCS=OFF ../MyDesigns

cmake --build . 

cmake --install . --component FlatControl
```
where `installDir` is the installation path.

### From GitHub releases
Download the releases from this repo. 

## Using the controls in your CMake project 

```CMake
include(FetchContent)
FetchContent_Declare(
	EstervDesigns
	GIT_REPOSITORY https://github.com/EddyTheCo/MyDesigns.git
	GIT_TAG v1.0.0 
	FIND_PACKAGE_ARGS 1.0  COMPONENTS FlatControl CONFIG
	)
FetchContent_MakeAvailable(EstervDesigns)

target_link_libraries(<target> <PRIVATE|PUBLIC|INTERFACE> EstervDesigns::FlatControl
$<$<STREQUAL:$<TARGET_PROPERTY:EstervDesigns::FlatControl,TYPE>,STATIC_LIBRARY>:EstervDesigns::FlatControlplugin>
)
```
## Using the controls

One needs to  make available to the QML engine the `Esterv.Controls.Flat` module by setting the [QML import path](https://doc.qt.io/qt-6/qtqml-syntax-imports.html#qml-import-path).

1. In your main function `engine.addImportPath("qrc:/esterVtech.com/imports");` to use the resource file. 

2. Set the environment variable like `export QML_IMPORT_PATH=installDir/CMAKE_INSTALL_LIBDIR`  where `CMAKE_INSTALL_LIBDIR` is where `Esterv` folder was created.

Then [select the style](https://doc.qt.io/qt-6/qtquickcontrols-styles.html#using-styles-in-qt-quick-controls) of your application like 
`./yourApp -style Esterv.Controls.Flat`

