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
pac -S cmake clang ninja qt6-base qt6-doc qt6-examples qt6-languageserver qt6-tools qt6-declarative qt6-wayland
```
