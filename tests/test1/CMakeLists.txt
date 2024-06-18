cmake_minimum_required(VERSION 3.27)
project(qt_test)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTORCC ON)
set(CMAKE_AUTOUIC ON)


find_package(Qt6 COMPONENTS
        Core
        Gui
        Widgets
        REQUIRED)

add_executable(qt_test main.cpp)
target_link_libraries(qt_test
        Qt::Core
        Qt::Gui
        Qt::Widgets
)

