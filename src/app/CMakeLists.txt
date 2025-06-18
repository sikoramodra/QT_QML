add_library(rpgroove STATIC
    # controller.cpp
    # controller.hpp
)

ecm_add_qml_module(rpgroove URI com.rpgroove GENERATE_PLUGIN_SOURCE
    OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/src/com/rpgroove
    QML_FILES
        qml/Main.qml
    DEPENDENCIES
        QtCore
        QtQuick
    # IMPORTS
    #     com.rpgroove.settings
)

qt_add_executable(rpgroove-app main.cpp)

target_include_directories(rpgroove-app PRIVATE ${CMAKE_BINARY_DIR})

target_link_libraries(rpgroove-app PRIVATE
    rpgroove
    rpgrooveplugin
)

target_include_directories(rpgroove PRIVATE
    ${CMAKE_BINARY_DIR}
    # ${CMAKE_CURRENT_SOURCE_DIR}/models
)

# target_link_libraries(rpgroove PRIVATE Settingsplugin)

target_link_libraries(rpgroove PUBLIC
    Qt6::Core
    Qt6::Gui
    Qt6::Qml
    Qt6::Quick
    Qt6::QuickControls2
    # Settings
)

if (ANDROID)
    ecm_add_android_apk(rpgroove-app ANDROID_DIR ${CMAKE_SOURCE_DIR}/android)
endif()

if (NOT ANDROID)
    set_target_properties(rpgroove-app PROPERTIES OUTPUT_NAME "rpgroove")
endif()

install(TARGETS rpgroove-app
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
)
