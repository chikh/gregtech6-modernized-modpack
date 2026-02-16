# GT6 Maintainable Modpack

This is an easily maintainable GregTech 6 modpack for Minecraft 1.7.10, managed using `packwiz`.

## Contents
- **GregTech 6**: The core mod (6.17.06).
- **IndustrialCraft 2 Experimental**: Required dependency.
- **Performance & Modern Java**:
    - **Angelica**: Backport of Sodium/Iris (HUGE performance boost, works best on Java 17+).
    - **ArchaicFix**: Essential fixes for modern Java and 1.7.10 stability.
    - **Hodgepodge**: Required compatibility patches for various mods on Java 17+.
    - **LWJGL3ify**: Replaces the ancient LWJGL2 with LWJGL3, enabling support for **Java 17, 21, and 25**.
    - **FalsePatternLib**: Required library for modern performance patches.
    - **FastCraft & BetterFps**: Legacy performance optimizations.
- **NEI (GTNH Fork)**: Recipe and item browser with JEI-style tabs and modern features.
- **Waila & Waila Harvestability**: Tooltips and block information.
- **JourneyMap**: Full-featured map and minimap.
- **GraveStone Mod**: Essential mod that creates a grave on death to safely store your items.
- **Better Storage (GTNH Edition)**: Adds immersive, wearable backpacks, reinforced chests, and lockers.
- **Default Config Pack (GT6)**: Pre-configured settings from the mod author to ensure correct worldgen and mod compatibility.
- **GT6 Ore Helper**: Essential tool for tracking and visualizing GregTech 6 ore veins.
- **Better Questing + Bear's Den Configs**: Fully configured questbook for GT6 progression.
- **Cooking for Blockheads**: Modular kitchen system for managing Pam's Harvestcraft food.
- **Pam's HarvestCraft**: Adds hundreds of new crops, foods, and the "Gardens" that spawn naturally in the world.
- **Chisel & Carpenter's Blocks**: The gold standard for 1.7.10 decoration and aesthetics.
- **ChunkPregenerator**: Efficient pregeneration of world chunks (configured for server-side only) to reduce lag during exploration.
- **QoL Mods**: Inventory Tweaks, Mouse Tweaks, Controlling, AppleCore, NEI Addons.

## Installation & Setup (Prism Launcher + Java 25)

To get the best performance and compatibility with modern Java:

### 1. Requirements
- **Prism Launcher**: A modern, open-source Minecraft launcher.
- **Java 25**: Download and install a recent build of OpenJDK 25.
- **Modpack Files**: The `pack.toml` and associated files from this repository.

### 2. Creating the Instance
1.  **Export the pack**: Run `packwiz curseforge export` in the project directory to create a `.zip` file.
2.  **Import to Prism**: Drag and drop the generated `.zip` into Prism Launcher or use **Add Instance** -> **Import from zip**.
3.  **LWJGL 3 Patch (Mandatory)**: 
    - Download [lwjgl3ify-3.0.11-multimc.zip](https://github.com/GTNewHorizons/lwjgl3ify/releases/download/3.0.11/lwjgl3ify-3.0.11-multimc.zip).
    - Right-click the instance in Prism and select **Folder**.
    - Extract the contents of the zip into this folder (where `mmc-pack.json` is located).
    - **Overwrite** the existing `mmc-pack.json` when prompted. This correctly configures the instance to use LWJGL 3 and the modern Java wrapper.

### 3. Configuring Java 25 & LWJGL 3
1.  **Select Instance**: Right-click the instance and select **Edit**.
2.  **Version**: In the **Version** tab, ensure you see **LWJGL 3** (manually add it via **Add** -> **LWJGL 3** if it's still showing LWJGL 2, though LWJGL3ify 3.0+ attempts to handle this).
3.  **Settings**: Go to **Settings** -> **Java**.
3.  **Java Runtime**: Enable the checkbox for **Java Runtime** and click **Auto-detect** (or manually browse) to select your **Java 25** binary.
4.  **JVM Arguments**: Add the following mandatory flags to **JVM Arguments** to allow the game to access internal components on modern Java, and to enable optimal performance:
    ```bash
    --add-opens java.base/java.io=ALL-UNNAMED
    --add-opens java.base/java.lang=ALL-UNNAMED
    --add-opens java.base/java.lang.reflect=ALL-UNNAMED
    --add-opens java.base/java.net=ALL-UNNAMED
    --add-opens java.base/java.nio=ALL-UNNAMED
    --add-opens java.base/java.security=ALL-UNNAMED
    --add-opens java.base/java.text=ALL-UNNAMED
    --add-opens java.base/java.util=ALL-UNNAMED
    --add-opens java.base/java.util.concurrent=ALL-UNNAMED
    --add-opens java.base/java.util.zip=ALL-UNNAMED
    --add-opens java.base/sun.nio.ch=ALL-UNNAMED
    --add-opens java.base/sun.security.action=ALL-UNNAMED
    --add-opens java.base/sun.security.util=ALL-UNNAMED
    --add-opens java.desktop/java.awt=ALL-UNNAMED
    --add-opens java.desktop/java.awt.color=ALL-UNNAMED
    --add-opens java.desktop/java.awt.desktop=ALL-UNNAMED
    --add-opens java.desktop/java.awt.dnd=ALL-UNNAMED
    --add-opens java.desktop/java.awt.event=ALL-UNNAMED
    --add-opens java.desktop/java.awt.font=ALL-UNNAMED
    --add-opens java.desktop/java.awt.geom=ALL-UNNAMED
    --add-opens java.desktop/java.awt.im=ALL-UNNAMED
    --add-opens java.desktop/java.awt.image=ALL-UNNAMED
    --add-opens java.desktop/java.awt.image.renderable=ALL-UNNAMED
    --add-opens java.desktop/java.awt.print=ALL-UNNAMED
    --add-opens java.desktop/sun.awt.image=ALL-UNNAMED
    --add-opens java.desktop/sun.awt=ALL-UNNAMED
    --add-opens java.desktop/sun.font=ALL-UNNAMED
    --add-opens java.desktop/sun.print=ALL-UNNAMED
    --add-opens java.naming/javax.naming=ALL-UNNAMED
    --enable-native-access=ALL-UNNAMED
    -XX:+UseZGC -XX:+ZGenerational -XX:+UnlockExperimentalVMOptions
    ```

### 4. Running
- The instance will automatically include **LWJGL3ify** and **ArchaicFix**, which are pre-configured to handle the 1.7.10 compatibility on Java 25.
- If you encounter rendering issues, ensure **Angelica** is enabled in the mods list.

## Docker Setup (itzg/minecraft-server)

If you plan to host the server using the `itzg/minecraft-server` Docker image with `TYPE=AUTO_CURSEFORGE`, you must configure it to handle the modern Java requirements for 1.7.10.

### 1. Requirements
- A `docker-compose.yml` file (template provided in the repo).
- Your exported `server-pack.zip` (hosted online or mapped as a volume).

### 2. Mandatory Environment Variables
Because 1.7.10 on Java 25 requires specific JVM flags and a patched loader, your Docker configuration must include:

- **JVM_XX_OPTS**: Must contain the long list of `--add-opens` and the RFB System Class Loader setting. (See the included `docker-compose.yml`).
- **JVM_OPTS**: Use `-XX:+UseZGC -XX:+ZGenerational` for optimal performance.
- **FORGE_INSTALLER_URL**: If `AUTO_CURSEFORGE` doesn't pick up the patches, you may need to manually place `lwjgl3ify-forgePatches.jar` in the volume and set it as the startup JAR.

### 3. Quick Start (Docker)
1.  Export your pack: `packwiz curseforge export --side server -o server-pack.zip`.
2.  Use the provided `docker-compose.yml`.
3.  Ensure the `lwjgl3ify-forgePatches.jar` is available in your server data directory.

## Server-Side Setup (Java 17-25)

To run a GregTech 6 server on modern Java, follow these mandatory steps:

### 1. Requirements
- **Forge 1.7.10 Server**: Install a standard Forge 10.13.4.1614 server.
- **Java 17, 21, or 25**: Ensure your server environment uses a modern JDK.

### 2. Artifact Preparation & Startup
1.  **Export the server mods**:
    ```bash
    packwiz curseforge export --side server -o server-pack.zip
    ```
2.  **Setup Server Folder**:
    - Extract `server-pack.zip` into your server's root directory.
    - **Note**: The `java9args.txt`, `start.sh`, and `start.bat` are already included in the root.
3.  **Download Forge Patches**: 
    Download [lwjgl3ify-3.0.11-forgePatches.jar](https://github.com/GTNewHorizons/lwjgl3ify/releases/download/3.0.11/lwjgl3ify-3.0.11-forgePatches.jar) and place it in the same folder.
    - **Rename it** to `lwjgl3ify-forgePatches.jar`.

### 3. Launching the Server
Simply run the included script for your platform:
- **Linux/macOS**: `./start.sh`
- **Windows**: `start.bat`

(You can adjust RAM allocation by editing these files).

## Server-Side Optimization & Tools
This mod is included to prevent lag during exploration by generating world chunks in advance.
- **Start Pregeneration**: To generate a square area of 100 chunks radius centered at (0,0):
  ```bash
  /pregen gen startradius square 0 0 100
  ```
- **Stop Pregeneration**: `/pregen stop`
- **Check Progress**: `/pregen showqueue`
- **Help**: `/pregen help`

### 3. Managing World Borders (WorldBorder-Forge)
Since Minecraft 1.7.10 does not have a built-in `/worldborder` command, this pack includes **WorldBorder-Forge** (configured for server-side only).
- **Set a Square Border**: To set a 2000-block radius border centered at (0,0):
  ```bash
  /wb set 2000 2000 0 0
  ```
- **Set a Circular Border**:
  ```bash
  /wb shape round
  /wb set 2000 0 0
  ```
- **Toggle Knockback**: `/wb knockback 3.0` (Distance players are pushed back when hitting the border).
- **Check Status**: `/wb`

## Maintenance

## Installation (Client)
1. Install Minecraft 1.7.10 with Forge 10.13.4.1614.
2. Use a packwiz-compatible launcher or the `packwiz-installer` bootstrap to download the mods.
3. Alternatively, export to a zip and import into your launcher.
