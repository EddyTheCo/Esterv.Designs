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

find_package(Qt6 COMPONENTS Core Gui Quick Qml  OPTIONAL_COMPONENTS  ShaderTools )
if (Qt6_FOUND)
	qt_standard_project_setup()
	if(NOT TARGET Qt6::ShaderTools)
		FetchContent_Declare(
			qtshadertools
			GIT_REPOSITORY git://code.qt.io/qt/qtshadertools.git
			GIT_TAG 6.5.0
			)
		FetchContent_MakeAvailable(qtshadertools)
	endif()
	set_source_files_properties(qml/CustomStyle.qml PROPERTIES
		QT_QML_SINGLETON_TYPE TRUE
		)
	qt6_add_qml_module(MyDesigns
		URI  MyDesigns
		VERSION 1.0
		SOURCES
		src/mydesigns.cpp include/mydesigns.hpp
		QML_FILES
                qml/QrLabel.qml
		qml/MyTextField.qml
		qml/AmountText.qml
		qml/MyTextArea.qml
                qml/QrTextCamPop.qml
                qml/QrCam.qml
		qml/MyFrame.qml
		qml/MyButton.qml
		qml/MyLabel.qml
                qml/AddressQr.qml
                qml/PayQrPop.qml
		qml/MyRadioButton.qml
		qml/MyCheckBox.qml
		qml/MySettButton.qml
		qml/Notification.qml
		qml/PlusButton.qml
		qml/CustomStyle.qml
		qml/CloseButton.qml	
		RESOURCE_PREFIX
		"/esterVtech.com/imports"
		OUTPUT_TARGETS out_targets_var
		OUTPUT_DIRECTORY
		${CMAKE_BINARY_DIR}/MyDesigns
		IMPORT_PATH ${CMAKE_BINARY_DIR}
		)

	target_include_directories(MyDesigns PUBLIC $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
		"$<INSTALL_INTERFACE:${CMAKE_INSTALL_INCLUDEDIR}/MyDesigns>")


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
		"frag/close.frag"
                "frag/qrscanner.frag"
		)



	target_link_libraries(MyDesigns PUBLIC Qt6::Gui Qt6::Quick)


	install(TARGETS MyDesigns MyDesignsplugin ${out_targets_var}  ${out_targets_var2}
		EXPORT MyDesignsTargets
		DESTINATION ${CMAKE_INSTALL_LIBDIR}
		)

	install(DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/include/
		DESTINATION ${CMAKE_INSTALL_INCLUDEDIR}/MyDesigns
		)
	install(DIRECTORY ${CMAKE_BINARY_DIR}/MyDesigns/
		DESTINATION ${CMAKE_INSTALL_LIBDIR}/QMLPlugins/MyDesigns
		)
	install(EXPORT MyDesignsTargets
		FILE MyDesignsTargets.cmake
		DESTINATION ${CMAKE_INSTALL_LIBDIR}/cmake/MyDesigns
		)
	include(CMakePackageConfigHelpers)
	configure_package_config_file(${CMAKE_CURRENT_SOURCE_DIR}/Config.cmake.in
		"${CMAKE_CURRENT_BINARY_DIR}/${PROJECT_NAME}Config.cmake"
		INSTALL_DESTINATION ${CMAKE_INSTALL_LIBDIR}/cmake/MyDesigns
		)
	write_basic_package_version_file(
		"${CMAKE_CURRENT_BINARY_DIR}/MyDesignsConfigVersion.cmake"
		VERSION ${VERSION}
		COMPATIBILITY SameMajorVersion
		)
	install(FILES
		${CMAKE_CURRENT_BINARY_DIR}/MyDesignsConfig.cmake
		${CMAKE_CURRENT_BINARY_DIR}/MyDesignsConfigVersion.cmake
		DESTINATION ${CMAKE_INSTALL_LIBDIR}/cmake/MyDesigns
		)
	export(EXPORT MyDesignsTargets
		FILE "${CMAKE_CURRENT_BINARY_DIR}/MyDesignsTargets.cmake"
		)
	if(CMAKE_PROJECT_NAME STREQUAL PROJECT_NAME)
		set(CPACK_PACKAGE_CONTACT "estervtech")
		include(CTest)
		set(CPACK_PACKAGE_FILE_NAME "${PROJECT_NAME}-v${SEMVER}-${CMAKE_SYSTEM_NAME}_${CMAKE_SYSTEM_VERSION}-${CMAKE_SYSTEM_PROCESSOR}-${CMAKE_CXX_COMPILER_ID}")
		include(CPack)
	endif()
endif(Qt6_FOUND)

