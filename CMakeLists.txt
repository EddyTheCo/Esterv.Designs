cmake_minimum_required(VERSION 3.16)
include(${CMAKE_CURRENT_BINARY_DIR}/local_conf.cmake OPTIONAL)
include(FetchContent)
FetchContent_Declare(
	ccommon
	GIT_REPOSITORY https://github.com/EddyTheCo/Common.git
	GIT_TAG v0.1.1
	)
FetchContent_MakeAvailable(ccommon)
version_from_git(
	LOG       OFF
	TIMESTAMP "%Y%m%d%H%M%S"
	)
project(EstervDesigns VERSION ${VERSION} LANGUAGES CXX)

set_property(GLOBAL PROPERTY USE_FOLDERS ON)
set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_EXTENSIONS OFF)
set(CMAKE_WINDOWS_EXPORT_ALL_SYMBOLS ON)
include(GNUInstallDirs)

find_package(Qt6 REQUIRED COMPONENTS Core Gui Quick Qml  OPTIONAL_COMPONENTS  ShaderTools )
qt_standard_project_setup()
if(NOT TARGET Qt6::ShaderTools)
	FetchContent_Declare(
		qtshadertools
		GIT_REPOSITORY git://code.qt.io/qt/qtshadertools.git
		GIT_TAG 6.5.0
		)
	FetchContent_MakeAvailable(qtshadertools)
endif()

add_subdirectory(Styles)
add_subdirectory(Controls)
add_subdirectory(CustomControls)



install(EXPORT ${PROJECT_NAME}-config
	FILE ${PROJECT_NAME}-config.cmake
	DESTINATION ${CMAKE_INSTALL_LIBDIR}/cmake/Esterv
	NAMESPACE ${PROJECT_NAME}::
	COMPONENT All
	)
include(CMakePackageConfigHelpers)
configure_package_config_file(${CMAKE_CURRENT_SOURCE_DIR}/Config.cmake.in
	"${CMAKE_CURRENT_BINARY_DIR}/${PROJECT_NAME}Config.cmake"
	INSTALL_DESTINATION ${CMAKE_INSTALL_LIBDIR}/cmake/Esterv
	)
write_basic_package_version_file(
	"${CMAKE_CURRENT_BINARY_DIR}/${PROJECT_NAME}ConfigVersion.cmake"
	VERSION ${VERSION}
	COMPATIBILITY SameMajorVersion
	)
install(FILES
	${CMAKE_CURRENT_BINARY_DIR}/${PROJECT_NAME}Config.cmake
	${CMAKE_CURRENT_BINARY_DIR}/${PROJECT_NAME}ConfigVersion.cmake
	DESTINATION ${CMAKE_INSTALL_LIBDIR}/cmake/Esterv
	)
export(EXPORT ${PROJECT_NAME}-config
	FILE "${CMAKE_CURRENT_BINARY_DIR}/${PROJECT_NAME}-config.cmake"
	)
if(CMAKE_PROJECT_NAME STREQUAL PROJECT_NAME)
	add_subdirectory(examples)
	set(CPACK_PACKAGE_CONTACT "estervtech")
	set(CPACK_PACKAGE_FILE_NAME "${PROJECT_NAME}-v${SEMVER}-${CMAKE_SYSTEM_NAME}_${CMAKE_SYSTEM_VERSION}-${CMAKE_SYSTEM_PROCESSOR}-${CMAKE_CXX_COMPILER_ID}")
	include(CPack)
endif()

if(BUILD_DOCS)
	get_target_property(build_docs cmake_build_docs SOURCES)
	include(${build_docs})
endif()
