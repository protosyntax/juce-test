# 1. CTest と Catch2 モジュールを先に読み込む
include(CTest)
include(Catch)
enable_testing()  # CTest を有効化

# 2. テスト用ソースをまとめる
file(GLOB TEST_SOURCES "${CMAKE_CURRENT_SOURCE_DIR}/*.cpp")


# 3. テスト実行ファイルを作成
add_executable(MyPluginTests ${TEST_SOURCES})
# ファイル個別指定も可能（この場合2の手順がいらない）
# add_executable(MyPluginTests test.cpp)

# 4. Catch2 をリンク
target_link_libraries(MyPluginTests PRIVATE Catch2::Catch2WithMain)

# 5. catch_discover_tests() でテストを登録
catch_discover_tests(MyPluginTests)

