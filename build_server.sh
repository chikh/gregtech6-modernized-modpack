#!/bin/bash
set -e

# Configuration
PACKWIZ_BINARY="$HOME/.aur/packwiz-git/packwiz"
BOOTSTRAP_URL="https://github.com/packwiz/packwiz-installer-bootstrap/releases/latest/download/packwiz-installer-bootstrap.jar"
# Minecraft Forge 1.7.10-10.13.4.1614 URL
FORGE_INSTALLER_URL="https://maven.minecraftforge.net/net/minecraftforge/forge/1.7.10-10.13.4.1614-1.7.10/forge-1.7.10-10.13.4.1614-1.7.10-installer.jar"
FORGE_PATCHES_URL="https://github.com/GTNewHorizons/lwjgl3ify/releases/download/3.0.11/lwjgl3ify-3.0.11-forgePatches.jar"

# Build paths
PROJECT_ROOT=$(pwd)
TEMP_BUILD_DIR=$(mktemp -d /tmp/gt6-build.XXXXXX)
DIST_DIR="$TEMP_BUILD_DIR/server-dist"
ZIP_NAME="gt6-modernized-server.zip"

# Determine target directory for the zip (prefer ../modpacks if it exists)
if [ -d "../modpacks" ]; then
    ZIP_TARGET="$PROJECT_ROOT/../modpacks/$ZIP_NAME"
else
    ZIP_TARGET="$PROJECT_ROOT/../$ZIP_NAME"
fi

echo "### Build Directory: $TEMP_BUILD_DIR"
mkdir -p "$DIST_DIR"

echo "### Refreshing packwiz index..."
"$PACKWIZ_BINARY" refresh

echo "### Preparing server distribution files..."
# Copy necessary files to the temp build dir
# We use a list to avoid copying junk
FILES_TO_COPY=(
    "config"
    "mods"
    "serverutilities"
    "java9args.txt"
    "pack.toml"
    "index.toml"
    "start.sh"
    "start.bat"
)

for file in "${FILES_TO_COPY[@]}"; do
    if [ -e "$file" ]; then
        cp -r "$file" "$DIST_DIR/"
    fi
done

echo "### Downloading Forge Installer..."
curl -Ls "$FORGE_INSTALLER_URL" -o "$TEMP_BUILD_DIR/forge-installer.jar"

echo "### Running Forge Installer (this may take a minute)..."
# Run installer inside the temp build directory to isolate library generation
cd "$DIST_DIR"
java -jar "$TEMP_BUILD_DIR/forge-installer.jar" --installServer > /dev/null
cd "$PROJECT_ROOT"

echo "### Downloading packwiz-installer-bootstrap..."
curl -Ls "$BOOTSTRAP_URL" -o "$TEMP_BUILD_DIR/packwiz-installer-bootstrap.jar"

echo "### Downloading all mod JARs (Server-side)..."
cd "$DIST_DIR"
# Run the installer. It will download JARs into the mods/ folder using the temp metadata
java -jar "$TEMP_BUILD_DIR/packwiz-installer-bootstrap.jar" --side server -no-gui "pack.toml"

echo "### Cleaning up metadata and unnecessary files..."
rm pack.toml index.toml
find mods -name "*.pw.toml" -delete

echo "### Downloading lwjgl3ify-forgePatches..."
curl -Ls "$FORGE_PATCHES_URL" -o "lwjgl3ify-forgePatches.jar"

echo "### Bundling into $ZIP_NAME..."
zip -rq "$ZIP_NAME" .
mv "$ZIP_NAME" "$ZIP_TARGET"
cd "$PROJECT_ROOT"

echo "### Cleaning up temporary files..."
rm -rf "$TEMP_BUILD_DIR"

echo "### Done! Server bundle is ready at: $ZIP_TARGET"
