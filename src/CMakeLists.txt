qt_add_library(musicplayer_src SHARED)

qt_add_qml_module(musicplayer_src
    URI src
    VERSION 1.0
    SOURCES
        PlayerController.cpp
        PlayerController.h
)

target_link_libraries(musicplayer_src PRIVATE
    Qt6::Core
    Qt6::Qml
)

target_compile_features(musicplayer_src PRIVATE cxx_std_20)

target_include_directories(musicplayer_src PUBLIC
    ${CMAKE_CURRENT_SOURCE_DIR}
)
