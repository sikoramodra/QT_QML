qt_add_qml_module(
  app
  URI test_project
  VERSION 0.1
  QML_FILES Main.qml
)

add_subdirectory(content)

target_link_libraries(app PRIVATE app_content)
