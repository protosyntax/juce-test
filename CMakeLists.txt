cmake_minimum_required(VERSION 3.31)

project(MyPlugin VERSION 1.0.0 LANGUAGES CXX)


# C++ 設定
set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

# clang や clangd 用にコンパイルコマンド出力
set(CMAKE_EXPORT_COMPILE_COMMANDS ON)

# JUCE
# libs/JUCE の CMakeLists.txt を読み込む
add_subdirectory(libs/JUCE)


# プラグイン本体
# add_subdirectory(src)


# テスト
# add_subdirectory(test)
