#!/bin/bash
set -e

# --- Configuration ---
PACKWIZ_BINARY="$HOME/.aur/packwiz-git/packwiz"
BOOTSTRAP_URL="https://github.com/packwiz/packwiz-installer-bootstrap/releases/latest/download/packwiz-installer-bootstrap.jar"
FORGE_INSTALLER_URL="https://maven.minecraftforge.net/net/minecraftforge/forge/1.7.10-10.13.4.1614-1.7.10/forge-1.7.10-10.13.4.1614-1.7.10-installer.jar"
FORGE_PATCHES_URL="https://github.com/GTNewHorizons/lwjgl3ify/releases/download/3.0.11/lwjgl3ify-3.0.11-forgePatches.jar"

# Paths
SCRIPT_DIR=$(dirname "$(readlink -f "$0")")
PROJECT_ROOT=$(dirname "$SCRIPT_DIR")
SRC_DIR="$PROJECT_ROOT/gt6-modpack"
CACHE_DIR="$PROJECT_ROOT/bin-cache"
BUILD_DIR="$PROJECT_ROOT/builds/server"
TEMP_BUILD_DIR=$(mktemp -d /tmp/gt6-build.XXXXXX)
DIST_DIR="$TEMP_BUILD_DIR/dist"
ZIP_NAME="gt6-modernized-server.zip"

mkdir -p "$CACHE_DIR" "$BUILD_DIR" "$DIST_DIR"

echo "### Starting build for GT6: Modernized Server ###"

# Optional: Update quests before building
if [[ "$1" == "--update-quests" ]]; then
    echo "### Updating quest book..."
    bash "$SCRIPT_DIR/update_quests.sh"
fi

echo "### Refreshing packwiz index..."
cd "$SRC_DIR"
"$PACKWIZ_BINARY" refresh
cd "$PROJECT_ROOT"

echo "### Preparing distribution files..."
# Copy source files to temp dist
cp -r "$SRC_DIR/." "$DIST_DIR/"

# Remove client-side only overrides if they exist (handled by side: server in packwiz, but good to be clean)
# We keep overrides/ because that's where java9args.txt and icon.png are.
# However, packwiz installer will handle moving overrides content to root.

echo "### Ensuring tools are cached..."
function fetch_tool() {
    local url=$1
    local target="$CACHE_DIR/$(basename "$url")"
    if [ ! -f "$target" ]; then
        echo "Downloading $(basename "$url")..."
        curl -Ls "$url" -o "$target"
    fi
    echo "$target"
}

FORGE_INSTALLER=$(fetch_tool "$FORGE_INSTALLER_URL")
BOOTSTRAP_JAR=$(fetch_tool "$BOOTSTRAP_URL")
FORGE_PATCHES=$(fetch_tool "$FORGE_PATCHES_URL")

echo "### Installing Forge Server..."
cd "$DIST_DIR"
java -jar "$FORGE_INSTALLER" --installServer > /dev/null

echo "### Running packwiz-installer (Server-side)..."
java -jar "$BOOTSTRAP_JAR" --side server -no-gui "pack.toml"

echo "### Cleaning up metadata..."
rm pack.toml index.toml
find mods -name "*.pw.toml" -delete

echo "### Adding lwjgl3ify-forgePatches..."
cp "$FORGE_PATCHES" "$DIST_DIR/lwjgl3ify-forgePatches.jar"

echo "### Bundling into $ZIP_NAME..."
zip -rq "$ZIP_NAME" .
mv "$ZIP_NAME" "$BUILD_DIR/"

echo "### Cleaning up temporary files..."
rm -rf "$TEMP_BUILD_DIR"

echo "### Done! Server bundle is ready at: $BUILD_DIR/$ZIP_NAME"
