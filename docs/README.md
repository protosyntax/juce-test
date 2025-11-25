# 環境構築（Windows + WSL/Debian想定）

WSL 上の Debian を利用し、Clang、Ninja、CMake などの開発環境を整備します。

参考：[JUCEをCMakeとVSCodeで開発する](https://qiita.com/tomoyanonymous/items/97cae1b83805ebcc2d00)

---

## 1. WSL と作業ディレクトリの準備

1. WSL をインストール（今回はDebian）。

2. Clang・CMake・Ninja のインストール（WSL / Debian）

```bash
sudo apt update
sudo apt install -y   clang clang-tools cmake ninja-build   build-essential pkg-config
```
```bash
clang --version
cmake --version
ninja --version
```

3. Debian上の任意の場所に作業ディレクトリを作成：

   ```bash
   mkdir ~/juce-test
   cd ~/juce-test
   ```
4. サブディレクトリを作成：

   ```bash
   mkdir libs src test
   ```

---

## 2. テストツール Catch2 の準備

1. `test/` に移動してテスト用ファイルを作成：

   ```bash
   cd test
   touch test.cpp
   ```

   内容：

   ```cpp
   #define CATCH_CONFIG_MAIN
   #include <catch2/catch_test_macros.hpp>

   TEST_CASE("Simple math") { REQUIRE(1 + 1 == 2); }
   ```

2. `test/CMakeLists.txt` を作成：

   ```cmake
   include(CTest)
   include(Catch)
   enable_testing()

   file(GLOB TEST_SOURCES "${CMAKE_CURRENT_SOURCE_DIR}/*.cpp")

   add_executable(MyPluginTests ${TEST_SOURCES})
   target_link_libraries(MyPluginTests PRIVATE Catch2::Catch2WithMain)
   catch_discover_tests(MyPluginTests)
   ```

---

## 3. JUCE の準備

1. `libs/` に移動して JUCE をクローン：

   ```bash
   cd ../libs
   git clone https://github.com/juce-framework/JUCE.git --recursive
   cd ..
   ```

2. 公式 example をコピー（動作確認用）：

   ```bash
   cp -r ./libs/JUCE/examples/CMake/AudioPlugin ./src
   ```

---

## 4. トップレベル CMakeLists.txt の作成

プロジェクト直下に `CMakeLists.txt` を作成：

```cmake
cmake_minimum_required(VERSION 3.31)
project(MyPlugin VERSION 1.0.0 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_EXPORT_COMPILE_COMMANDS ON)
set(CMAKE_EXPERIMENTAL_CXX_MODULE_CMAKE_API OFF)
set(CMAKE_CXX_SCAN_FOR_MODULES OFF)

# Catch2
include(FetchContent)
FetchContent_Declare(
  catch2
  GIT_REPOSITORY https://github.com/catchorg/Catch2.git
  GIT_TAG v3.11.0
)
FetchContent_MakeAvailable(catch2)
enable_testing()

# JUCE
# Windows側、つまりwslホストである`C:/Users/任意のJUCEの置き場所`にもJUCEをクローンしておきます
if(WIN32)
    set(JUCE_PATH "C:/Users/任意のJUCEの置き場所")
    set(JUCE_BINARY_DIR "${CMAKE_BINARY_DIR}/JUCE_win")
elseif(UNIX)
    set(JUCE_PATH "${CMAKE_SOURCE_DIR}/libs/JUCE")
    set(JUCE_BINARY_DIR "${CMAKE_BINARY_DIR}/JUCE_wsl")
endif()

if(EXISTS "${JUCE_PATH}/CMakeLists.txt")
    add_subdirectory(${JUCE_PATH} ${JUCE_BINARY_DIR})
else()
    message(FATAL_ERROR "JUCE not found at ${JUCE_PATH}")
endif()

add_subdirectory(src/AudioPlugin)
add_subdirectory(test)
```

---

## 5. ビルドと依存ライブラリのインストール

1. ビルド確認：

   ```bash
   cmake -B build -G Ninja
   ```

2. おそらくコケるので、必要なライブラリをインストールする：

   ```bash
   sudo apt update
   sudo apt install -y \
     build-essential cmake ninja-build pkg-config \
     libfreetype-dev libfontconfig1-dev libx11-dev \
     libasound2-dev libgl1-mesa-dev \
     libgtk-3-dev libcurl4-openssl-dev
   ```

   > WebKitGTK 4.0 (`libwebkit2gtk-4.0-dev`) はwsl標準レポジトリにないようなので一旦無視

3. 再度ビルド確認：

   ```bash
   cmake -B build -G Ninja
   ```

---

## 6. Git に保存

作業ディレクトリを Git にコミットして管理。
`.gitignore` 例：

```gitignore
/build/
CMakeFiles/
compile_commands.json
*.ninja*
JuceLibraryCode/
```

---

## 7. Makefile 例

```makefile
# Makefile for MyPlugin (CMake + Ninja)
BUILD_DIR := build
GENERATOR := Ninja
BUILD_TYPE := Debug
CMAKE := cmake
NINJA := ninja
SRC_DIR := src
TEST_DIR := test

.PHONY: all
all: build

.PHONY: configure
configure:
	@mkdir -p $(BUILD_DIR)
	$(CMAKE) -B $(BUILD_DIR) -G $(GENERATOR) -DCMAKE_BUILD_TYPE=$(BUILD_TYPE)

.PHONY: build
build: configure
	$(CMAKE) --build $(BUILD_DIR)

.PHONY: clean
clean:
	rm -rf $(BUILD_DIR)

.PHONY: rebuild
rebuild: clean all

.PHONY: clangd
clangd: configure
	@cp $(BUILD_DIR)/compile_commands.json .

.PHONY: log
log: configure
	$(NINJA) -C $(BUILD_DIR) -v > $(BUILD_DIR)/build.log 2>&1
	@echo "Build log: $(BUILD_DIR)/build.log"

.PHONY: test
test: build
	$(CMAKE) --build $(BUILD_DIR) --target test

.PHONY: ctest
ctest: build
	ctest --test-dir $(BUILD_DIR) --output-on-failure

.PHONY: tidy-src
tidy-src: clangd
	clang-tidy -p $(BUILD_DIR) $(shell find $(SRC_DIR) -name '*.cpp')

# test用にtidy-testも定義していたがうまくいかなかったので省略

.PHONY: tidy
tidy: tidy-src

.PHONY: fmt
fmt:
	clang-format -i $(shell find $(SRC_DIR) $(TEST_DIR) -name '*.cpp' -o -name '*.h')
```

---

## 8. Visual Studio 上でのビルド

1. Visual Studio 2022 (Community 版で十分) をインストール
2. 「リポジトリのクローン」を選択し Git レポジトリを指定
3. クローン後、ソリューションエクスプローラーからプロジェクトを選択すると自動でビルド

成功すると、`.exe` や VST ファイルが生成されます。
（メニューの`ビルド` > `すべてビルド`でも可）

参考：`src/CMakeLists.txt` 内の定義：
```
FORMATS AU VST3 Standalone
```

これでプラグイン開発環境が完成！
