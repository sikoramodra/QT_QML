qt_add_library(app_src STATIC)

qt_add_qml_module(app_src
    URI MusicPlayer.Controllers
    VERSION 1.0
    SOURCES
        PlayerController.cpp
        PlayerController.h
)

target_link_libraries(app_src PRIVATE
    Qt6::Core
    Qt6::Qml
)

target_compile_features(app_src PRIVATE cxx_std_20)

target_include_directories(app_src PUBLIC
    ${CMAKE_CURRENT_SOURCE_DIR}
)
