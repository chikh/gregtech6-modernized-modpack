#!/bin/bash
set -e

# Configuration
PACKWIZ_BINARY="$HOME/.aur/packwiz-git/packwiz"
BOOTSTRAP_URL="https://github.com/packwiz/packwiz-installer-bootstrap/releases/latest/download/packwiz-installer-bootstrap.jar"
FORGE_PATCHES_URL="https://github.com/GTNewHorizons/lwjgl3ify/releases/download/3.0.11/lwjgl3ify-3.0.11-forgePatches.jar"
DIST_DIR="../server-dist"

echo "### Cleaning up previous build..."
rm -rf "$DIST_DIR"
rm -rf ../server-bundle.zip
mkdir -p "$DIST_DIR"

echo "### Refreshing packwiz index..."
"$PACKWIZ_BINARY" refresh

echo "### Preparing server-dist folder..."
cp -r config "$DIST_DIR/"
cp java9args.txt "$DIST_DIR/"
cp pack.toml "$DIST_DIR/"
cp index.toml "$DIST_DIR/"
cp -r mods "$DIST_DIR/"

echo "### Downloading packwiz-installer-bootstrap..."
# Download to the project root (parent of current gt6-modpack dir)
curl -L "$BOOTSTRAP_URL" -o ../packwiz-installer-bootstrap.jar

echo "### Downloading all mod JARs (Server-side)..."
cd "$DIST_DIR"
# The bootstrap jar is in the parent of this directory (server-dist/..)
java -jar ../packwiz-installer-bootstrap.jar --side server -no-gui "pack.toml"

echo "### Cleaning up metadata from server-dist..."
rm pack.toml index.toml
find mods -name "*.pw.toml" -delete
cd -

echo "### Downloading lwjgl3ify-forgePatches..."
curl -L "$FORGE_PATCHES_URL" -o "$DIST_DIR/lwjgl3ify-forgePatches.jar"

echo "### Bundling into server-bundle.zip..."
cd "$DIST_DIR"
zip -r ../server-bundle.zip .
cd -

echo "### Done! Server bundle is ready in server-bundle.zip (outside modpack folder)"
