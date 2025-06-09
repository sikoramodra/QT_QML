qt_add_library(musicplayer_src STATIC)

qt_add_qml_module(musicplayer_src
    URI src
    VERSION 1.0
    SOURCES
        PlayerController.hpp
        PlayerController.cpp
)
