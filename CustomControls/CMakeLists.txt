
qt6_add_qml_module(customControls
	URI  Esterv.CustomControls
	VERSION ${VERSION}
	QML_FILES
	qml/PrevButton.qml
	qml/NextButton.qml
	qml/ThemeSwitch.qml
	RESOURCE_PREFIX
	"/esterVtech.com/imports"
	OUTPUT_TARGETS out_targets_var
	OUTPUT_DIRECTORY
	${CMAKE_BINARY_DIR}/Esterv/CustomControls
	IMPORT_PATH ${CMAKE_BINARY_DIR}
	)


target_link_libraries(customControls PUBLIC Qt6::Gui Qt6::Quick SimpleStyle )


install(TARGETS customControls ${out_targets_var}
        EXPORT ${PROJECT_NAME}-config
	DESTINATION ${CMAKE_INSTALL_LIBDIR}
	COMPONENT CustomControls
	)
install(DIRECTORY ${CMAKE_BINARY_DIR}/Esterv/CustomControls
	DESTINATION ${CMAKE_INSTALL_LIBDIR}/Esterv
	COMPONENT CustomControls
	)
install(TARGETS customControlsplugin 
        EXPORT ${PROJECT_NAME}-config
	DESTINATION ${CMAKE_INSTALL_LIBDIR}/Esterv/CustomControls
	COMPONENT CustomControls
	)

