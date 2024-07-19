qt_add_library(app_content STATIC)

qt6_add_qml_module(
  app_content
  URI content
  VERSION 0.1
  QML_FILES 
    AudioBox.qml
    TextButton.qml
)
