
qt6_add_qml_module(FlatControl
	URI  Esterv.Controls.Flat
	VERSION ${VERSION}
	QML_FILES
	qml/Button.qml
	RESOURCE_PREFIX
	"/esterVtech.com/imports"
	OUTPUT_TARGETS out_targets_var
	OUTPUT_DIRECTORY
	${CMAKE_BINARY_DIR}/Esterv/Controls/Flat
	IMPORT_PATH ${CMAKE_BINARY_DIR}
	)



target_link_libraries(FlatControl PUBLIC Qt6::Gui Qt6::Quick SimpleStyle)


install(TARGETS FlatControl ${out_targets_var}
        EXPORT ${PROJECT_NAME}-config
	DESTINATION ${CMAKE_INSTALL_LIBDIR}
	COMPONENT Controls
	EXCLUDE_FROM_ALL
	)
install(TARGETS FlatControlplugin 
        EXPORT ${PROJECT_NAME}-config
	DESTINATION ${CMAKE_INSTALL_LIBDIR}/Esterv/Controls/Flat
	COMPONENT Controls
	EXCLUDE_FROM_ALL
	)

install(DIRECTORY ${CMAKE_BINARY_DIR}/Esterv/Controls/Flat
	DESTINATION ${CMAKE_INSTALL_LIBDIR}/Esterv/Controls/Flat
	COMPONENT Controls
	EXCLUDE_FROM_ALL
	)
