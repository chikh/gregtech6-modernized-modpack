#!/bin/bash

# Configuration
INDEX_URL="https://gregtech.overminddl1.com/downloads/gregtech_1.7.10/index.html"
TMP_DIR=".gemini/tmp/gt6_config_update"
PROJECT_ROOT=$(pwd)
CONFIG_DIR="$PROJECT_ROOT/gt6-modpack/config"

echo "Starting GregTech 6 Default Config Update..."

# 1. Dynamically find the latest config pack URL
echo "Finding latest config pack URL from $INDEX_URL..."
# We look for the first occurrence of defaultConfigPack.zip in an href
# Note: Some links are relative, some are absolute. We handle both.
LATEST_URL=$(curl -s "$INDEX_URL" | grep -oP 'href="\K[^"]*defaultConfigPack\.zip' | head -n 1)

if [[ -z "$LATEST_URL" ]]; then
    echo "Error: Could not find defaultConfigPack.zip link on index page."
    exit 1
fi

# If it's a relative URL, prepend the base domain
if [[ "$LATEST_URL" == /* ]]; then
    LATEST_URL="https://gregtech.overminddl1.com$LATEST_URL"
fi

echo "Found latest URL: $LATEST_URL"

# 2. Create temporary directory
mkdir -p "$TMP_DIR"
cd "$TMP_DIR" || exit

# 3. Download the config pack
echo "Downloading config pack..."
curl -L -o Defaultconfigpack.zip "$LATEST_URL"

# Check if file is actually a zip and has size
if [[ ! -s Defaultconfigpack.zip ]]; then
    echo "Error: Downloaded file is empty."
    exit 1
fi

# 4. Extract the config pack
echo "Extracting configs..."
# We use -o to overwrite and -q for quiet
unzip -qo Defaultconfigpack.zip -d extracted

# 5. Merge with project config
echo "Merging configs into $CONFIG_DIR..."
# The zip usually contains a 'config/' folder at the root or inside a versioned folder.
# Let's find where the 'config' folder actually is in the extracted files.
EXTRACTED_CONFIG_DIR=$(find extracted -type d -name "config" | head -n 1)

if [[ -z "$EXTRACTED_CONFIG_DIR" ]]; then
    echo "Error: Could not find 'config' directory in the downloaded pack."
    # List contents to help debugging if it fails
    ls -R extracted
    exit 1
fi

cp -R "$EXTRACTED_CONFIG_DIR"/* "$CONFIG_DIR/"

# 6. Manual Overrides / Post-processing
echo "Applying project-specific overrides..."

# 7. Clean up
cd "$PROJECT_ROOT" || exit
rm -rf "$TMP_DIR"

echo "Config update complete!"
