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

- Qt ver.
  - Desktop
  - Android
  - Libs
    - Qt 5 compatibility module
    - Qt lsp
    - QT shader tools
    - Qt wayland compositor

```sh
cmake -S . -B build-android-arm64-debug -G Ninja \
    -DCMAKE_BUILD_TYPE=Debug \
    -DCMAKE_TOOLCHAIN_FILE=$ANDROID_NDK_ROOT/build/cmake/android.toolchain.cmake \
    -DANDROID_ABI=arm64-v8a \
    -DANDROID_PLATFORM=android-35 \
    -DQT_HOST_PATH=$QT_HOST_ROOT \
    -DCMAKE_FIND_ROOT_PATH=$QT_ANDROID_ROOT

cmake --build build-android-arm64-debug

cmake --build build-android-arm64-debug --target apk
```

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
