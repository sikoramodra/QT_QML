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

#### Pkgs

```sh
pac -S cmake clang ninja qt6-base qt6-doc qt6-examples qt6-languageserver qt6-tools qt6-declarative qt6-wayland qt6-5compat
paru -S android-aarch64-qt6-base
```

---

- CMakeLists.txt
- src/app/CMakeLists.txt
- android/AndroidManifest.xml

#### Android

- install Android Studio
- install device (eg. Pixel 9 API 36) in directory ~/Android/Sdk
- in Android Studio: `Tools` > `SDK Manager` > `NDK (Side by side)` && `Android SDK Command-line Tools` && `CMake`

---

---

---

---

---

---

---

I can build binary for of qt app android, but how do I convert it to apk or how do I change cmakes to generate apk for android?

CMakeLists.txt

```
cmake_minimum_required(VERSION 3.23)
set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
project(rpgroove VERSION 0.0.0)
find_package(Qt6 6.9 REQUIRED COMPONENTS
    Core
    Gui
    Qml
    Quick
    QuickControls2
)
add_definitions(
    -DQT_NO_CAST_FROM_ASCII
    -DQT_NO_CAST_TO_ASCII
    -DQT_NO_URL_CAST_FROM_STRING
    -DQT_USE_QSTRINGBUILDER
    -DQT_NO_NARROWING_CONVERSIONS_IN_CONNECT
)
set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTORCC ON)
qt_policy(SET QTP0001 NEW)
qt_policy(SET QTP0004 NEW)
add_subdirectory(src)
```

src/CMakeLists.txt

```
add_subdirectory(app)
```

src/app/CMakeLists.txt

```
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
add_executable(rpgroove-app main.cpp)
target_include_directories(rpgroove-app PRIVATE ${CMAKE_BINARY_DIR})
target_link_libraries(rpgroove-app PRIVATE
    rpgroove
    rpgrooveplugin
)
set_target_properties(rpgroove-app PROPERTIES
    OUTPUT_NAME "rpgroove"
    RUNTIME_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}
)
install(TARGETS rpgroove-app
    BUNDLE  DESTINATION .
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
)
```

src/app/main.cpp

```cpp
#include <QGuiApplication>
#include <QQmlApplicationEngine>

int main(int argc, char *argv[]) {
    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;
    QObject::connect(&engine, &QQmlApplicationEngine::quit, &app,
                     &QGuiApplication::quit);

    engine.loadFromModule("com.rpgroove", "Main");

    return app.exec();
}
```

```sh
$ cmake -S . -B build-android-arm64-debug -G Ninja \
    -DCMAKE_BUILD_TYPE=Debug \
    -DCMAKE_TOOLCHAIN_FILE=$ANDROID_NDK_ROOT/build/cmake/android.toolchain.cmake \
    -DANDROID_ABI=arm64-v8a \
    -DANDROID_PLATFORM=android-35 \
    -DANDROID_STL=c++_shared \
    -DQT_HOST_PATH=$QT_HOST_ROOT \
    -DCMAKE_PREFIX_PATH=$QT_ANDROID_ROOT \
    -DCMAKE_FIND_ROOT_PATH=$QT_ANDROID_ROOT

cmake --build build-android-arm64-debug
```

---

---

---

---

---

---

---

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
    -DANDROID_STL=c++_shared \
    -DQT_HOST_PATH=$QT_HOST_ROOT \
    -DCMAKE_PREFIX_PATH=$QT_ANDROID_ROOT \
    -DCMAKE_FIND_ROOT_PATH=$QT_ANDROID_ROOT

cmake --build build-android-arm64-debug
```
