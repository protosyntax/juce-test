# テスト関連のmakeコマンドについて

- `make test`
    - Make が登録したテストターゲット（Catch2 の `catch_discover_tests` で自動生成されたテスト）をビルド＆実行

- `make ctest`
  - 直接 `ctest` コマンドを呼び出してテストを実行、失敗時の出力も確認可能

- ビルド前に自動で configure と build が走るので、手動で順番を気にする必要なし

---

# `test/CMakeLists.txt`について

```cmake
# Catch2 のターゲットをリンク
add_executable(MyPluginTests test.cpp)
```

まとめて指定する場合は：
```
file(GLOB TEST_SOURCES test/*.cpp)
add_executable(MyPluginTests ${TEST_SOURCES})
target_link_libraries(MyPluginTests PRIVATE Catch2::Catch2WithMain)
catch_discover_tests(MyPluginTests)
```

* **役割**：テスト用の実行ファイルを作る
* `MyPluginTests` → このターゲット（生成される実行ファイル）の名前
* `test.cpp` → ビルドに使うソースファイル
* **変数部分**：`MyPluginTests`（ターゲット名）、`test.cpp`（ソースファイル名）
* この行で **Catch2 の main() はまだ含まれない**（後でリンクで追加）

---

```cmake
target_link_libraries(MyPluginTests PRIVATE Catch2::Catch2WithMain)
```

* **役割**：ターゲットにライブラリをリンク
* `MyPluginTests` → 先ほど作ったターゲット
* `PRIVATE` → このリンクはターゲット内部だけに適用される
* `Catch2::Catch2WithMain` → Catch2 が提供する「main() を含むヘッダオンリーターゲット」
* これで `test.cpp` 内に `#define CATCH_CONFIG_MAIN` を書かなくても OK
* **変数部分**：`MyPluginTests`（ターゲット名）、`Catch2::Catch2WithMain`（ライブラリ名）

---

```cmake
# CMake で test() を使えるように登録
include(CTest)
```

* **役割**：CMake の **CTest モジュールを読み込む**
* これにより `add_test()` や `enable_testing()` が使えるようになる
* 変数は特になく、単に CMake の機能を有効化

---

```cmake
include(Catch)
```

* **役割**：Catch2 が提供する CMake 用モジュールを読み込む
* `catch_discover_tests()` などの関数が使えるようになる
* 変数は特になし

---

```cmake
catch_discover_tests(MyPluginTests)
```

* **役割**：Catch2 のテストケースを **CTest に登録**
* `MyPluginTests` → 実行ファイル（ターゲット）名
* Catch2 のソース内で定義された `TEST_CASE` を自動で検出して CTest に登録
* これにより `cmake --build build --target test` や `ctest` で実行可能になる
* **変数部分**：`MyPluginTests`（テスト実行ファイル名）

---

### まとめ

* **ターゲット名**：`MyPluginTests`
* **ソースファイル**：`test.cpp`
* **リンクライブラリ**：`Catch2::Catch2WithMain`
* **CTest 登録**：`catch_discover_tests()` で自動化

つまり、**ターゲット名とソースファイルだけがプロジェクトごとに変わる部分**で、それ以外は固定のモジュール読み込みや関数呼び出しです。

---
