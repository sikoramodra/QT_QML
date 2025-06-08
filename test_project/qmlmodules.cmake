qt_add_qml_module(music_player
    URI MusicPlayer
    VERSION 1.0
    QML_FILES
        Main.qml
)

add_subdirectory(src)
add_subdirectory(content)
