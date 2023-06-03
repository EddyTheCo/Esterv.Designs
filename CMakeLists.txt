cmake_minimum_required(VERSION 3.16)

include(FetchContent)
FetchContent_Declare(
	ccommon
	GIT_REPOSITORY https://github.com/EddyTheCo/Common.git
	GIT_TAG main
	)
FetchContent_MakeAvailable(ccommon)
version_from_git(
	LOG       OFF
	TIMESTAMP "%Y%m%d%H%M%S"
	)
project(MyDesigns VERSION ${VERSION} LANGUAGES CXX)

set_property(GLOBAL PROPERTY USE_FOLDERS ON)
set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_EXTENSIONS OFF)
set(CMAKE_WINDOWS_EXPORT_ALL_SYMBOLS ON)
include(GNUInstallDirs)

find_package(Qt6 COMPONENTS Core Gui Quick Qml ShaderTools REQUIRED)
qt_standard_project_setup()

set_source_files_properties(qml/CustomStyle.qml PROPERTIES
	QT_QML_SINGLETON_TYPE TRUE
	)

qt6_add_qml_module(MyDesigns
	URI  MyDesigns
	VERSION 1.0
	OUTPUT_TARGETS out_targets_var
	QML_FILES
	qml/TextAddress.qml
	qml/MyTextField.qml
	qml/AmountText.qml
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
	qml/SettWheelShadder.qml
	qml/PlusShadder.qml
	qml/PlusButton.qml
	qml/CustomStyle.qml
	qml/GaussianBlurShadder.qml
	RESOURCE_PREFIX
	"/esterVtech.com/imports"
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
	"frag/plus.frag"
	"frag/gausianBlur.frag"
	"frag/voronoi.frag"
	)



target_link_libraries(MyDesigns PUBLIC Qt6::Gui Qt6::Quick)


install(TARGETS MyDesigns ${out_targets_var}  ${out_targets_var2}
	EXPORT ${PROJECT_NAME}-config
	DESTINATION ${CMAKE_INSTALL_LIBDIR}
	)

install(EXPORT ${PROJECT_NAME}-config
	FILE ${PROJECT_NAME}Targets.cmake
	DESTINATION ${CMAKE_INSTALL_LIBDIR}/cmake/${PROJECT_NAME}
	)
include(CMakePackageConfigHelpers)
configure_package_config_file(${CMAKE_CURRENT_SOURCE_DIR}/Config.cmake.in
	"${CMAKE_CURRENT_BINARY_DIR}/${PROJECT_NAME}Config.cmake"
	INSTALL_DESTINATION ${CMAKE_INSTALL_LIBDIR}/cmake/${PROJECT_NAME}
	)
write_basic_package_version_file(
	"${CMAKE_CURRENT_BINARY_DIR}/${PROJECT_NAME}ConfigVersion.cmake"
	VERSION ${VERSION}
	COMPATIBILITY SameMajorVersion
	)
install(FILES
	${CMAKE_CURRENT_BINARY_DIR}/${PROJECT_NAME}Config.cmake
	${CMAKE_CURRENT_BINARY_DIR}/${PROJECT_NAME}ConfigVersion.cmake
	DESTINATION ${CMAKE_INSTALL_LIBDIR}/cmake/${PROJECT_NAME}
	)
export(EXPORT ${PROJECT_NAME}-config
	FILE "${CMAKE_CURRENT_BINARY_DIR}/${PROJECT_NAME}-config.cmake"
	)
if(CMAKE_PROJECT_NAME STREQUAL PROJECT_NAME)
	include(CTest)
	set(CPACK_PACKAGE_FILE_NAME "${PROJECT_NAME}-v${SEMVER}-${CMAKE_SYSTEM_NAME}_${CMAKE_SYSTEM_VERSION}-${CMAKE_SYSTEM_PROCESSOR}-${CMAKE_CXX_COMPILER_ID}")
	if(NOT BUILD_SHARED_LIBS)
		set(CPACK_PACKAGE_FILE_NAME "${CPACK_PACKAGE_FILE_NAME}-static")
	endif(NOT BUILD_SHARED_LIBS)
	include(CPack)
endif()

list(APPEND QML_IMPORT_PATH ${CMAKE_CURRENT_SOURCE_DIR}/qml ${CMAKE_CURRENT_BINARY_DIR}/)
list(REMOVE_DUPLICATES QML_IMPORT_PATH)
set(QML_IMPORT_PATH ${QML_IMPORT_PATH} CACHE STRING "" FORCE)

