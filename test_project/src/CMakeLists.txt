qt_add_library(app_src SHARED)

qt_add_qml_module(
  app_src
  URI src
  VERSION 0.1
  SOURCES
    PlayerController.cpp
    PlayerController.h
)
