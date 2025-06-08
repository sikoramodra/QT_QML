qt_add_library(app_content STATIC)

qt_add_qml_module(app_content
    URI MusicPlayer.Components
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

target_link_libraries(app_content PRIVATE
    Qt6::Core
    Qt6::Quick
)
