if(BUILD_EXAMPLES)
  include(InstallRequiredSystemLibraries)
  if(EMSCRIPTEN)
    find_package(Qt6 REQUIRED COMPONENTS QuickControls2)
  endif(EMSCRIPTEN)

  qt_add_executable(aboutCli aboutCli.cpp)
  target_link_libraries(aboutCli PRIVATE about${CMAKE_PROJECT_NAME}-cli)

  set_target_properties(aboutCli PROPERTIES WIN32_EXECUTABLE ON MACOSX_BUNDLE
                                                                ON)
  install(
    TARGETS aboutCli
    COMPONENT ${PROJECT_NAME}-examples
    BUNDLE DESTINATION . COMPONENT ${PROJECT_NAME}-examples)
  if(QTDEPLOY)
    qt_generate_deploy_app_script(TARGET aboutCli OUTPUT_SCRIPT deploy_script)
    install(SCRIPT ${deploy_script} COMPONENT ${PROJECT_NAME}-examples)
  endif(QTDEPLOY)

  foreach(example "example1" "aboutGui")
    qt_add_executable(${example} ${example}.cpp)

    qt6_add_qml_module(
      ${example}
      URI
      E${example}
      VERSION
      1.0
      QML_FILES
      "qml/${example}.qml"
      RESOURCE_PREFIX
      "/esterVtech.com/imports"
      IMPORT_PATH
      ${CMAKE_BINARY_DIR})

    target_link_libraries(
      ${example}
      PRIVATE
        Qt::Gui
        Qt::Qml
        Qt::Quick
        CustomControls
        $<$<STREQUAL:$<TARGET_PROPERTY:CustomControls,TYPE>,STATIC_LIBRARY>:CustomControlsplugin>
        About${CMAKE_PROJECT_NAME}
        $<$<STREQUAL:$<TARGET_PROPERTY:About${CMAKE_PROJECT_NAME},TYPE>,STATIC_LIBRARY>:About${CMAKE_PROJECT_NAME}plugin>
    )

    set_target_properties(${example} PROPERTIES WIN32_EXECUTABLE ON
                                                MACOSX_BUNDLE ON)
    install(
      TARGETS ${example}
      COMPONENT ${PROJECT_NAME}-examples
      BUNDLE DESTINATION . COMPONENT ${PROJECT_NAME}-examples)
    if(QTDEPLOY)
      qt_generate_deploy_qml_app_script(TARGET ${example} OUTPUT_SCRIPT
                                        deploy_script)
      install(SCRIPT ${deploy_script} COMPONENT ${PROJECT_NAME}-examples)
    endif(QTDEPLOY)
    if(EMSCRIPTEN)
      target_link_libraries(
        ${example}
        PRIVATE
          FlatControl
          Qt6::QuickControls2
          $<$<STREQUAL:$<TARGET_PROPERTY:FlatControl,TYPE>,STATIC_LIBRARY>:FlatControlplugin>
      )
      target_compile_definitions(${example}
                                 PRIVATE FORCE_STYLE="Esterv.Controls.Flat")
    endif(EMSCRIPTEN)
  endforeach()
endif(BUILD_EXAMPLES)
