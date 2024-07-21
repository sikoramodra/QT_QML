qt_add_library(app_content STATIC)

qt_add_qml_module(
  app_content
  URI content
  VERSION 0.1
  QML_FILES 
    AudioBox.qml
    ImageButton.qml
  RESOURCES
    images/song-image-default.png
    images/play-circle.svg
    images/pause-circle.svg
    images/arrow-left-circle.svg
    images/arrow-right-circle.svg
)
