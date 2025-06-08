qt_add_library(musicplayer_content STATIC)

qt_add_qml_module(musicplayer_content
    URI content
    VERSION 1.0
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
