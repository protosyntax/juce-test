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


# Ninja の詳細ビルドログを出力
.PHONY: log
log: configure
	@echo "Building project with log..."
	$(NINJA) -C $(BUILD_DIR) -v > $(BUILD_DIR)/build.log 2>&1
	@echo "Build log: $(BUILD_DIR)/build.log"
