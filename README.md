# GT6 Maintainable Modpack

This is an easily maintainable GregTech 6 modpack for Minecraft 1.7.10, managed using `packwiz`.

## Contents
- **GregTech 6**: The core mod (6.17.06).
- **IndustrialCraft 2 Experimental**: Required dependency.
- **Performance & Modern Java**:
    - **Angelica**: Backport of Sodium/Iris (HUGE performance boost, works best on Java 17+).
    - **ArchaicFix**: Essential fixes for modern Java and 1.7.10 stability.
    - **LWJGL3ify**: Replaces the ancient LWJGL2 with LWJGL3, enabling support for **Java 17, 21, and 25**.
    - **FalsePatternLib**: Required library for modern performance patches.
    - **FastCraft & BetterFps**: Legacy performance optimizations.
- **NEI (GTNH Fork)**: Recipe and item browser with JEI-style tabs and modern features.
- **Waila & Waila Harvestability**: Tooltips and block information.
- **JourneyMap**: Full-featured map and minimap.
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

### 3. Configuring Java 25
1.  **Select Instance**: Right-click the instance and select **Edit**.
2.  **Settings**: Go to **Settings** -> **Java**.
3.  **Java Runtime**: Enable the checkbox for **Java Runtime** and click **Auto-detect** (or manually browse) to select your **Java 25** binary.
4.  **JVM Arguments**: Add the following to **JVM Arguments** for optimal performance:
    ```bash
    -XX:+UseZGC -XX:+ZGenerational -XX:+UnlockExperimentalVMOptions
    ```

### 4. Running
- The instance will automatically include **LWJGL3ify** and **ArchaicFix**, which are pre-configured to handle the 1.7.10 compatibility on Java 25.
- If you encounter rendering issues, ensure **Angelica** is enabled in the mods list.

## Maintenance

## Installation (Client)
1. Install Minecraft 1.7.10 with Forge 10.13.4.1614.
2. Use a packwiz-compatible launcher or the `packwiz-installer` bootstrap to download the mods.
3. Alternatively, export to a zip and import into your launcher.
