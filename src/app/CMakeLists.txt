add_library(rpgroove STATIC
    # controller.cpp
    # controller.hpp
)

qt_add_qml_module(rpgroove
    URI com.rpgroove
    OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/src/com/rpgroove
    QML_FILES
        qml/Main.qml
)

target_include_directories(rpgroove PRIVATE
    ${CMAKE_BINARY_DIR}
    ${CMAKE_CURRENT_SOURCE_DIR}/models
)

target_link_libraries(rpgroove PUBLIC
    Qt6::Core
    Qt6::Gui
    Qt6::Qml
    Qt6::Quick
    Qt6::QuickControls2
)

add_executable(rpgroove-app
    main.cpp
)

target_include_directories(rpgroove-app PRIVATE ${CMAKE_BINARY_DIR})

target_link_libraries(rpgroove-app PRIVATE
    rpgroove
    rpgrooveplugin
)

set_target_properties(rpgroove-app PROPERTIES OUTPUT_NAME "rpgroove")

install(TARGETS rpgroove-app
    BUNDLE  DESTINATION .
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
)
