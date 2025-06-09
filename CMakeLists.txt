cmake_minimum_required(VERSION 3.21)

project(MusicPlayer
    VERSION 1.0.0
    LANGUAGES CXX
)

set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(Qt6 6.9 REQUIRED COMPONENTS
    Quick
)

qt_standard_project_setup(REQUIRES 6.9)

qt_add_executable(MusicPlayer
    src/main.cpp
)

include(qmlmodules.cmake)

target_link_libraries(MusicPlayer PRIVATE
    Qt6::Quick
)

install(TARGETS MusicPlayer
    BUNDLE  DESTINATION .
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
)
