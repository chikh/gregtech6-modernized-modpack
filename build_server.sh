#!/bin/bash
set -e

# Configuration
PACKWIZ_BINARY="$HOME/.aur/packwiz-git/packwiz"
BOOTSTRAP_URL="https://github.com/packwiz/packwiz-installer-bootstrap/releases/latest/download/packwiz-installer-bootstrap.jar"
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

echo "### Downloading packwiz-installer-bootstrap..."
curl -L "$BOOTSTRAP_URL" -o ../packwiz-installer-bootstrap.jar

echo "### Downloading all mod JARs (Server-side)..."
cd "$DIST_DIR"
java -jar ../packwiz-installer-bootstrap.jar --side server -no-gui "pack.toml"

echo "### Cleaning up metadata and unnecessary files from server-dist..."
rm pack.toml index.toml
find mods -name "*.pw.toml" -delete
rm -rf build_server.sh AI_CONTEXT.md .git docker-compose.yml
cd -

echo "### Bundling into $ZIP_NAME..."
cd "$DIST_DIR"
zip -r "$ZIP_NAME" .
mv "$ZIP_NAME" "$ZIP_TARGET"
cd -

echo "### Done! Server bundle is ready at: $ZIP_TARGET"
