set_source_files_properties(qml/Style.qml PROPERTIES
	QT_QML_SINGLETON_TYPE TRUE
	)
qt6_add_qml_module(SimpleStyle
	URI  Esterv.Styles.Simple
	VERSION ${VERSION}
	QML_FILES
	qml/Style.qml
	RESOURCE_PREFIX
	"/esterVtech.com/imports"
	OUTPUT_TARGETS out_targets_var
	OUTPUT_DIRECTORY
	${CMAKE_BINARY_DIR}/Esterv/Styles/Simple
	IMPORT_PATH ${CMAKE_BINARY_DIR}
	)
add_library(${PROJECT_NAME}::SimpleStyle ALIAS SimpleStyle)
add_library(${PROJECT_NAME}::SimpleStyleplugin ALIAS SimpleStyleplugin)
qt6_add_shaders(SimpleStyle "esterVtech.com.imports.Styles.Simple"
	BATCHABLE
	PRECOMPILE
	OPTIMIZED
	OUTPUT_TARGETS out_targets_var2
	PREFIX
	"/esterVtech.com/imports/Designs"
	FILES
	"frag/hollowArrowHead.frag"
	"frag/filledArrowHead.frag"
	"frag/sunTomoon.frag"
	)


target_link_libraries(SimpleStyle PUBLIC Qt6::Gui Qt6::Quick)


install(TARGETS SimpleStyle ${out_targets_var}  ${out_targets_var2}
        EXPORT ${PROJECT_NAME}-config
	DESTINATION ${CMAKE_INSTALL_LIBDIR}
	COMPONENT SimpleStyle 
	)
install(DIRECTORY ${CMAKE_BINARY_DIR}/Esterv/Styles/Simple
	DESTINATION ${CMAKE_INSTALL_LIBDIR}/Esterv/Styles
	COMPONENT SimpleStyle 
	)
install(TARGETS SimpleStyleplugin
        EXPORT ${PROJECT_NAME}-config
	DESTINATION ${CMAKE_INSTALL_LIBDIR}/Esterv/Styles/Simple
	COMPONENT SimpleStyle 
	)


