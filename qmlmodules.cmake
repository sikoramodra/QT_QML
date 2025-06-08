qt_add_qml_module(MusicPlayer
    URI Main
    VERSION 1.0
    QML_FILES
        Main.qml
)

add_subdirectory(src)
add_subdirectory(content)

target_link_libraries(MusicPlayer PRIVATE
    musicplayer_content
    musicplayer_src
)
