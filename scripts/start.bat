@echo off
IF NOT EXIST java9args.txt (
    echo Error: java9args.txt not found!
    pause
    exit /b 1
)

IF NOT EXIST lwjgl3ify-forgePatches.jar (
    echo Error: lwjgl3ify-forgePatches.jar not found!
    echo Please download it from: https://github.com/GTNewHorizons/lwjgl3ify/releases/download/3.0.11/lwjgl3ify-3.0.11-forgePatches.jar
    pause
    exit /b 1
)

java -Xmx6G -Xms6G @java9args.txt -jar lwjgl3ify-forgePatches.jar nogui
pause
