

add_library(aboutthis include/about.hpp src/about.cpp)
target_compile_definitions(aboutthis PRIVATE CMAKE_PROJECT_VERSION="${CMAKE_PROJECT_VERSION}")
target_compile_definitions(aboutthis PRIVATE CMAKE_PROJECT_NAME="${CMAKE_PROJECT_NAME}")
target_compile_definitions(aboutthis PRIVATE CMAKE_ARCH="${CMAKE_CXX_COMPILER_ID} ${CMAKE_CXX_COMPILER_VERSION} \(${CMAKE_SYSTEM_NAME} ${CMAKE_SYSTEM_VERSION}\),${CMAKE_SYSTEM_PROCESSOR}" )

target_link_libraries(aboutthis PUBLIC Qt6::Core)
target_include_directories(aboutthis PUBLIC $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
                "$<INSTALL_INTERFACE:${CMAKE_INSTALL_INCLUDEDIR}/Esterv/>")

if(USE_QML)
target_link_libraries(aboutthis PUBLIC Qt6::Gui Qt6::Quick)
target_compile_definitions(aboutthis PRIVATE USE_QML)
endif(USE_QML)

qt6_add_qml_module(CustomControls
	URI  Esterv.CustomControls
	VERSION 1.0
	QML_FILES
        "qml/PrevButton.qml"
        "qml/NextButton.qml"
        "qml/ThemeSwitch.qml"
        "qml/CloseButton.qml"
        "qml/PinPad.qml"
	RESOURCE_PREFIX
	"/esterVtech.com/imports"
	OUTPUT_TARGETS out_targets_var
	OUTPUT_DIRECTORY
	${CMAKE_BINARY_DIR}/Esterv/CustomControls
	IMPORT_PATH ${CMAKE_BINARY_DIR}
	)

add_library(${PROJECT_NAME}::CustomControls ALIAS CustomControls)
set_target_properties(CustomControls PROPERTIES VERSION ${VERSION} SOVERSION ${VERSION_MAJOR})
add_library(${PROJECT_NAME}::CustomControlsplugin ALIAS CustomControlsplugin)

target_link_libraries(CustomControls PUBLIC Qt6::Gui Qt6::Quick SimpleStyle )


install(TARGETS CustomControls ${out_targets_var}
        EXPORT ${PROJECT_NAME}-config
	DESTINATION ${CMAKE_INSTALL_LIBDIR}
	COMPONENT CustomControls
        RUNTIME DESTINATION "${CMAKE_INSTALL_BINDIR}" COMPONENT CustomControls
	)
install(DIRECTORY ${CMAKE_BINARY_DIR}/Esterv/CustomControls
	DESTINATION ${CMAKE_INSTALL_LIBDIR}/Esterv
	COMPONENT CustomControls
	)
install(TARGETS CustomControlsplugin 
        EXPORT ${PROJECT_NAME}-config
	DESTINATION ${CMAKE_INSTALL_LIBDIR}/Esterv/CustomControls
	COMPONENT CustomControls
        RUNTIME DESTINATION "${CMAKE_INSTALL_BINDIR}" COMPONENT CustomControls
	)

