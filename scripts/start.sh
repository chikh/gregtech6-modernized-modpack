#!/bin/bash
# Check if java9args.txt exists
if [ ! -f "java9args.txt" ]; then
    echo "Error: java9args.txt not found!"
    exit 1
fi

# Check if forge patches exist
if [ ! -f "lwjgl3ify-forgePatches.jar" ]; then
    echo "Error: lwjgl3ify-forgePatches.jar not found!"
    echo "Please download it from: https://github.com/GTNewHorizons/lwjgl3ify/releases/download/3.0.11/lwjgl3ify-3.0.11-forgePatches.jar"
    exit 1
fi

java -Xmx6G -Xms6G @java9args.txt -jar lwjgl3ify-forgePatches.jar nogui
