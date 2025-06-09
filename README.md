#### Debug

```sh
mkdir ./build
cmake -S . -B ./build -G Ninja -DCMAKE_BUILD_TYPE=Debug -DCMAKE_EXPORT_COMPILE_COMMANDS=ON -DQT_QML_GENERATE_QMLLS_INI=ON
cmake --build ./build
```

#### Release

```sh
mkdir ./build
cmake -S . -B ./build -G Ninja -DCMAKE_BUILD_TYPE=Release -DCMAKE_CXX_FLAGS_RELEASE="-O3 -march=native -mtune=native -DNDEBUG -flto" -DCMAKE_INTERPROCEDURAL_OPTIMIZATION=ON
cmake --build ./build
```

#### Qmllint

```sh
qmllint -I build Main.qml
```

#### Pkgs

```sh
pac -S cmake clang ninja qt6-base qt6-doc qt6-examples qt6-languageserver qt6-tools qt6-declarative qt6-wayland
```

### Future Architecture

```sh
MusicPlayer/
├── CMakeLists.txt
├── qmlmodules.cmake
├── Main.qml
│
├── src/                              # C++ backend source files
│   ├── CMakeLists.txt
│   ├── main.cpp
│   ├── controllers/*Controller.?pp   # Business logic controllers
│   ├── models/*Model.?pp             # Data models
│   └── utils/*.?pp                   # Utility classes
│
├── qml/                              # QML UI files (renamed from content)
│   ├── CMakeLists.txt
│   ├── components/*.qml              # Reusable UI components
│   └── views/*View.qml               # Main application views
│
└── resources/                        # Static resources
    ├── qrc/                          # Qt resource files
    │   ├── icons.qrc
    │   ├── images.qrc
    │   ├── fonts.qrc
    │   └── shaders.qrc
    ├── images/
    │   ├── icons/
    │   │   ├── arrow-left-circle.svg
    │   │   ├── arrow-right-circle.svg
    │   │   ├── pause-circle.svg
    │   │   └── play-circle.svg
    │   ├── backgrounds/*
    │   ├── logos/*
    │   └── defaults/
    │       └── song-image-default.png
    ├── fonts/*                       # ~ Custom fonts
    ├── shaders/*.{frag,vert}         # ~ GLSL shaders for effects
    └── audio/*                       # ~ Sample audio files
```
