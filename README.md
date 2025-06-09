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
