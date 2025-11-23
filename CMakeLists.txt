cmake_minimum_required(VERSION 3.31)

project(MyPlugin VERSION 1.0.0 LANGUAGES CXX)


# C++ 設定
set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

# clang や clangd 用にコンパイルコマンド出力
set(CMAKE_EXPORT_COMPILE_COMMANDS ON)

# テストツールCatch2の設定
include(FetchContent)
FetchContent_Declare(
  catch2
  GIT_REPOSITORY https://github.com/catchorg/Catch2.git
  GIT_TAG v3.11.0  # 任意の安定版
)
FetchContent_MakeAvailable(catch2)
enable_testing()  # CTest 有効化

# JUCE
# libs/JUCE の CMakeLists.txt を読み込む
add_subdirectory(libs/JUCE)


# プラグイン本体
add_subdirectory(src/AudioPlugin)


# テスト
add_subdirectory(test)
