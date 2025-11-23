cmake_minimum_required(VERSION 3.31)

project(MyPlugin VERSION 1.0.0 LANGUAGES CXX)

# C++ 設定
set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

# clang / clangd 用 compile_commands.json 生成
set(CMAKE_EXPORT_COMPILE_COMMANDS ON)

# CMake が勝手にモジュール推論するのを止める
set(CMAKE_EXPERIMENTAL_CXX_MODULE_CMAKE_API OFF)
set(CMAKE_CXX_SCAN_FOR_MODULES OFF)

# テストツール Catch2 の設定
include(FetchContent)
FetchContent_Declare(
  catch2
  GIT_REPOSITORY https://github.com/catchorg/Catch2.git
  GIT_TAG v3.11.0
)
FetchContent_MakeAvailable(catch2)
enable_testing()

# JUCE
add_subdirectory(libs/JUCE)

# プラグイン本体
add_subdirectory(src/AudioPlugin)

# テスト
add_subdirectory(test)
