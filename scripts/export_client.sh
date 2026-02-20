#!/bin/bash
set -e

# --- Configuration ---
PACKWIZ_BINARY="$HOME/.aur/packwiz-git/packwiz"

# Paths
SCRIPT_DIR=$(dirname "$(readlink -f "$0")")
PROJECT_ROOT=$(dirname "$SCRIPT_DIR")
SRC_DIR="$PROJECT_ROOT/gt6-modpack"
BUILD_DIR="$PROJECT_ROOT/builds/client"

mkdir -p "$BUILD_DIR"

# Get version from pack.toml
VERSION=$(grep "^version =" "$SRC_DIR/pack.toml" | cut -d'"' -f2)
PACK_NAME=$(grep "^name =" "$SRC_DIR/pack.toml" | cut -d'"' -f2)
ZIP_NAME="${PACK_NAME}-${VERSION}.zip"

echo "### Exporting Client Pack: $ZIP_NAME ###"

cd "$SRC_DIR"
"$PACKWIZ_BINARY" refresh
"$PACKWIZ_BINARY" curseforge export -o "$BUILD_DIR/$ZIP_NAME"

echo "### Done! Client bundle is ready at: $BUILD_DIR/$ZIP_NAME"
