# GT6 Maintainable Modpack

This is an easily maintainable GregTech 6 modpack for Minecraft 1.7.10, managed using `packwiz`.

## Contents
- **GregTech 6**: The core mod (6.17.06).
- **IndustrialCraft 2 Experimental**: Required dependency.
- **Performance & Modern Java**:
    - **Angelica**: Backport of Sodium/Iris (HUGE performance boost, works best on Java 17+).
    - **ArchaicFix**: Essential fixes for modern Java and 1.7.10 stability.
    - **FalsePatternLib**: Required library for modern performance patches.
    - **FastCraft & BetterFps**: Legacy performance optimizations.
- **NEI (GTNH Fork)**: Recipe and item browser with JEI-style tabs and modern features.
- **Waila & Waila Harvestability**: Tooltips and block information.
- **JourneyMap**: Full-featured map and minimap.
- **QoL Mods**: Inventory Tweaks, Mouse Tweaks, Controlling, AppleCore, NEI Addons.

## Java Version & Performance
This pack is optimized for **Java 17 or Java 21**. 
- To run on modern Java, it is highly recommended to use the **CleanroomMC** loader (a drop-in replacement for Forge 1.7.10).
- If using standard Forge, you may need a "Java 9+ Compatibility" mod.
- Use ZGC (Generational) on Java 21 for the best experience: `-XX:+UseZGC -XX:+ZGenerational`.
To update mods or add new ones:
1. Use `packwiz curseforge add [slug]` or `packwiz url add [name] [url]`.
2. Run `packwiz refresh` to update the index.
3. Export the pack using `packwiz curseforge export` (for a CurseForge-compatible zip) or just share the files for use with the `packwiz-installer`.

## Installation (Client)
1. Install Minecraft 1.7.10 with Forge 10.13.4.1614.
2. Use a packwiz-compatible launcher or the `packwiz-installer` bootstrap to download the mods.
3. Alternatively, export to a zip and import into your launcher.
