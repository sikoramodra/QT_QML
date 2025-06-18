#### Debug

```sh
  cmake --preset dev
  cmake --build --preset dev
```

#### Release

```sh
  cmake --preset release
  cmake --build --preset release
```

#### Qmllint

```sh
qmllint -I build Main.qml
```

#### Android

- install Android Studio
- install device (eg. Pixel 9 API 36) in directory ~/Android/Sdk
- in Android Studio: `Tools` > `SDK Manager` > `NDK (Side by side)` && `Android SDK Command-line Tools` && `CMake`

```sh
    QT_QPA_PLATFORM=xcb ./qt-online-installer-linux-x64-4.10.0.run
```

```sh
sudo pacman -S python-requests python-pyxdg python-yaml
```

- Qt ver.
  - Desktop
  - Android
  - Libs
    - Qt 5 compatibility module
    - Qt lsp
    - QT shader tools
    - Qt wayland compositor

```sh
├── CMakeLists.txt
├── CMakePresets.json
└── src
    ├── app
    │   ├── CMakeLists.txt
    │   ├── main.cpp
    │   ├── *.{cpp,hpp}
    │   └── qml
    │   │   └── Main.qml
    │   └── models
    │       └── *model.{hpp,cpp}
    ├── CMakeLists.txt
    ├── settings
    │   ├── CMakeLists.txt
    │   ├── *.{hpp,cpp}
    │   └── qml
    │   │   └── *.qml
    │   └── models
    │       └── *model.{hpp,cpp}
    └── OTHER_PLUGINS (like settings)
```

```sh
cmake -S . -B build -G Ninja -DCMAKE_BUILD_TYPE=Debug
cmake --build build
```

export JAVA_HOME="/usr/lib/jvm/java-17-openjdk"

```sh
/opt/Qt/6.9.1/android_arm64_v8a/bin/qt-cmake -S . -B build-android-arm64-debug -G Ninja \
            -DCMAKE_BUILD_TYPE=Debug \
            -DQT_CHAINLOAD_TOOLCHAIN_FILE=/home/wm/Android/Sdk/ndk/29.0.13599879/build/cmake/android.toolchain.cmake \
            -DANDROID_SDK_ROOT=/home/wm/Android/Sdk \
            -DANDROID_ABI=arm64-v8a \
            -DANDROID_PLATFORM=android-35 \
            -DECM_DIR=/usr/share/ECM/cmake

cmake --build build-android-arm64-debug
```
