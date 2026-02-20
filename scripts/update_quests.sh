#!/bin/bash
# Script to update BetterQuesting quest book content from Bear's Den repository

set -e

REPO_URL="https://github.com/BearsDen989-GT/GT6BetterQuesting/archive/refs/heads/main.zip"
TEMP_DIR=$(mktemp -d)
ZIP_FILE="$TEMP_DIR/quests.zip"

SCRIPT_DIR=$(dirname "$(readlink -f "$0")")
PROJECT_ROOT=$(dirname "$SCRIPT_DIR")
TARGET_DIR="$PROJECT_ROOT/gt6-modpack/config/betterquesting"

echo "Downloading latest quest book content..."
curl -L "$REPO_URL" -o "$ZIP_FILE"

echo "Extracting content..."
unzip -q "$ZIP_FILE" -d "$TEMP_DIR"

# The ZIP contains a top-level directory like GT6BetterQuesting-main
EXTRACTED_DIR=$(find "$TEMP_DIR" -maxdepth 1 -type d -name "GT6BetterQuesting-*" | head -n 1)
SOURCE_DIR="$EXTRACTED_DIR/minecraft/config/betterquesting"

if [ ! -d "$SOURCE_DIR" ]; then
    echo "Error: Could not find expected directory structure in the downloaded ZIP."
    rm -rf "$TEMP_DIR"
    exit 1
fi

echo "Updating quest files in $TARGET_DIR..."

# Sync DefaultQuests and resources
if command -v rsync >/dev/null 2>&1; then
    rsync -av --delete "$SOURCE_DIR/DefaultQuests/" "$TARGET_DIR/DefaultQuests/"
    rsync -av --delete "$SOURCE_DIR/resources/" "$TARGET_DIR/resources/"
else
    echo "rsync not found, using cp (note: will not delete orphaned local files)..."
    cp -r "$SOURCE_DIR/DefaultQuests/." "$TARGET_DIR/DefaultQuests/"
    cp -r "$SOURCE_DIR/resources/." "$TARGET_DIR/resources/"
fi

# Optional: Update questbook.cfg if it exists in the source
if [ -f "$SOURCE_DIR/questbook.cfg" ]; then
    cp "$SOURCE_DIR/questbook.cfg" "$TARGET_DIR/questbook.cfg"
fi

echo "Ensuring correct directory structure for BetterQuesting (GTNH)..."
LINES_DIR="$TARGET_DIR/DefaultQuests/QuestLines"
if [ -d "$LINES_DIR" ]; then
    find "$LINES_DIR" -maxdepth 1 -name "*.json" ! -name "QuestLine.json" | while read -r json_file; do
        filename=$(basename "$json_file")
        dirname="${filename%.json}"
        mkdir -p "$LINES_DIR/$dirname"
        mv "$json_file" "$LINES_DIR/$dirname/QuestLine.json"
        echo "Converted $filename -> $dirname/QuestLine.json"
    done
fi

echo "Cleaning up..."
rm -rf "$TEMP_DIR"

echo "Quest book updated successfully!"
