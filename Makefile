# Makefile for MyPlugin (CMake + Ninja)

# ビルドディレクトリ
BUILD_DIR := build

# CMake generator
GENERATOR := Ninja

# ビルドタイプ
BUILD_TYPE := Debug

# CMake コマンド
CMAKE := cmake
NINJA := ninja

# ソースディレクトリ
SRC_DIR := src
TEST_DIR := test

# デフォルトターゲット
.PHONY: all
all: build

# CMake configure
.PHONY: configure
configure:
	@echo "Configuring CMake..."
	@mkdir -p $(BUILD_DIR)
	$(CMAKE) -B $(BUILD_DIR) -G $(GENERATOR) -DCMAKE_BUILD_TYPE=$(BUILD_TYPE)

# ビルド
.PHONY: build
build: configure
	@echo "Building project..."
	$(CMAKE) --build $(BUILD_DIR)

# クリーン
.PHONY: clean
clean:
	@echo "Cleaning build directory..."
	rm -rf $(BUILD_DIR)

# 再ビルド
.PHONY: rebuild
rebuild: clean all

# clangd 用 compile_commands.json 更新
.PHONY: clangd
clangd: configure
	@echo "Updating compile_commands.json..."
	@cp $(BUILD_DIR)/compile_commands.json .

# Ninja の詳細ビルドログ
.PHONY: log
log: configure
	@echo "Building project with log..."
	$(NINJA) -C $(BUILD_DIR) -v > $(BUILD_DIR)/build.log 2>&1
	@echo "Build log: $(BUILD_DIR)/build.log"

# テスト
.PHONY: test
test: build
	@echo "Running tests..."
	$(CMAKE) --build $(BUILD_DIR) --target test

.PHONY: ctest
ctest: build
	@echo "Running tests with ctest..."
	ctest --test-dir $(BUILD_DIR) --output-on-failure

# 文法チェック
.PHONY: tidy-src
tidy-src: clangd
	@echo "Running clang-tidy on src..."
	clang-tidy -p $(BUILD_DIR) $(shell find $(SRC_DIR) -name '*.cpp')

.PHONY: tidy-test
tidy-test: clangd
	@echo "Running clang-tidy on src..."
	clang-tidy -p $(BUILD_DIR) $(shell find $(TEST_DIR) -name '*.cpp')

.PHONY: tidy
tidy: tidy-src tidy-test

# フォーマッタ
.PHONY: fmt
fmt:
	@echo "Running clang-format..."
	clang-format -i $(shell find $(SRC_DIR) $(TEST_DIR) -name '*.cpp' -o -name '*.h')
