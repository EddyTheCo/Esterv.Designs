
qt6_add_qml_module(CustomControls
	URI  Esterv.CustomControls
	VERSION 1.0
	QML_FILES
        "qml/PrevButton.qml"
        "qml/NextButton.qml"
        "qml/ThemeSwitch.qml"
        "qml/CloseButton.qml"
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
	)
install(DIRECTORY ${CMAKE_BINARY_DIR}/Esterv/CustomControls
	DESTINATION ${CMAKE_INSTALL_LIBDIR}/Esterv
	COMPONENT CustomControls
	)
install(TARGETS CustomControlsplugin 
        EXPORT ${PROJECT_NAME}-config
	DESTINATION ${CMAKE_INSTALL_LIBDIR}/Esterv/CustomControls
	COMPONENT CustomControls
	)

