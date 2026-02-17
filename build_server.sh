#!/bin/bash
set -e

# Configuration
PACKWIZ_BINARY="$HOME/.aur/packwiz-git/packwiz"
BOOTSTRAP_URL="https://github.com/packwiz/packwiz-installer-bootstrap/releases/latest/download/packwiz-installer-bootstrap.jar"
# Note: The Forge 1.7.10 maven path is specifically formatted with the MC version twice
FORGE_INSTALLER_URL="https://maven.minecraftforge.net/net/minecraftforge/forge/1.7.10-10.13.4.1614-1.7.10/forge-1.7.10-10.13.4.1614-1.7.10-installer.jar"
FORGE_PATCHES_URL="https://github.com/GTNewHorizons/lwjgl3ify/releases/download/3.0.11/lwjgl3ify-3.0.11-forgePatches.jar"
DIST_DIR="../server-dist"
ZIP_NAME="gt6-modernized-server.zip"

# Determine target directory for the zip (prefer ../modpacks if it exists)
if [ -d "../modpacks" ]; then
    ZIP_TARGET="../modpacks/$ZIP_NAME"
else
    ZIP_TARGET="../$ZIP_NAME"
fi

echo "### Cleaning up previous build..."
rm -rf "$DIST_DIR"
rm -f "$ZIP_TARGET"
mkdir -p "$DIST_DIR"

echo "### Refreshing packwiz index..."
"$PACKWIZ_BINARY" refresh

echo "### Preparing server-dist folder (copying all tracked files)..."
cp -r . "$DIST_DIR/"

echo "### Downloading Forge Installer & Building Library Stack..."
curl -L "$FORGE_INSTALLER_URL" -o forge-installer.jar
# Install server into the dist directory to get libraries/ and server jars
java -jar forge-installer.jar --installServer "$DIST_DIR"
rm forge-installer.jar

echo "### Downloading packwiz-installer-bootstrap..."
curl -L "$BOOTSTRAP_URL" -o ../packwiz-installer-bootstrap.jar

echo "### Downloading all mod JARs (Server-side)..."
cd "$DIST_DIR"
# Run the installer. It will download JARs into the mods/ folder
java -jar ../packwiz-installer-bootstrap.jar --side server -no-gui "pack.toml"

echo "### Cleaning up metadata and unnecessary files from server-dist..."
rm pack.toml index.toml
find mods -name "*.pw.toml" -delete
rm -rf build_server.sh AI_CONTEXT.md .git docker-compose.yml logo.png icon.png
cd -

echo "### Downloading lwjgl3ify-forgePatches..."
curl -L "$FORGE_PATCHES_URL" -o "$DIST_DIR/lwjgl3ify-forgePatches.jar"

echo "### Bundling into $ZIP_NAME..."
cd "$DIST_DIR"
zip -r "$ZIP_NAME" .
mv "$ZIP_NAME" "$ZIP_TARGET"
cd -

echo "### Done! Server bundle is ready at: $ZIP_TARGET"
echo "### The bundle now includes all mandatory libraries and Forge/Minecraft jars."
