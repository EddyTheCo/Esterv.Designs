
qt6_add_qml_module(FlatControl
	URI  Esterv.Controls.Flat
	VERSION ${VERSION}
	QML_FILES
        "qml/Button.qml"
        "qml/RoundButton.qml"
	RESOURCE_PREFIX
	"/esterVtech.com/imports"
	OUTPUT_TARGETS out_targets_var
	OUTPUT_DIRECTORY
	${CMAKE_BINARY_DIR}/Esterv/Controls/Flat
	IMPORT_PATH ${CMAKE_BINARY_DIR}
	)


add_library(${PROJECT_NAME}::FlatControl ALIAS FlatControl)
add_library(${PROJECT_NAME}::FlatControlplugin ALIAS FlatControlplugin)

target_link_libraries(FlatControl PUBLIC Qt6::Gui Qt6::Quick SimpleStyle)


install(TARGETS FlatControl ${out_targets_var}
        EXPORT ${PROJECT_NAME}-config
	DESTINATION ${CMAKE_INSTALL_LIBDIR}
        COMPONENT FlatControl
	)
install(DIRECTORY ${CMAKE_BINARY_DIR}/Esterv/Controls/Flat
	DESTINATION ${CMAKE_INSTALL_LIBDIR}/Esterv/Controls
	COMPONENT FlatControl
	)
install(TARGETS FlatControlplugin 
        EXPORT ${PROJECT_NAME}-config
	DESTINATION ${CMAKE_INSTALL_LIBDIR}/Esterv/Controls/Flat
	COMPONENT FlatControl
	)

