qt_add_library(Settings STATIC)

qt_add_qml_module(Settings
    URI com.rpgroove.settings
    OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/src/com/rpgroove/settings
    QML_FILES
        # qml/SettingsView.qml
    SOURCES
        # settings.cpp
)

target_include_directories(Settings PRIVATE
    ${CMAKE_BINARY_DIR}
    ${CMAKE_CURRENT_SOURCE_DIR}/models
)

target_link_libraries(Settings PRIVATE
    Qt6::Core
    Qt6::Gui
    Qt6::Qml
    Qt6::Quick
    Qt6::QuickControls2
)
