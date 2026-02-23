# GT6: Modernized (Source)

This directory contains the core modpack source files managed by `packwiz`.

## Design Philosophy
1.  **Gregified Vanilla**: A GregTech 6 experience focused on physical systems and industrial progression.
2.  **Modern Runtime**: Optimized for Java 17-25 and LWJGL 3.
3.  **Performance**: Includes Angelica (Sodium), ArchaicFix, and Hodgepodge for high-FPS gameplay.

## Installation & Setup (Prism Launcher + Java 25)

To get the best performance and compatibility with modern Java:

### 1. Requirements
- **Prism Launcher**: A modern, open-source Minecraft launcher.
- **Java 25**: Download and install a recent build of OpenJDK 25.

### 2. Setup
1.  Export the pack using `packwiz curseforge export` (from this directory).
2.  Import the resulting ZIP into your launcher.
3.  **LWJGL 3 Patch (Mandatory)**: 
    - Download [lwjgl3ify-3.0.11-multimc.zip](https://github.com/GTNewHorizons/lwjgl3ify/releases/download/3.0.11/lwjgl3ify-3.0.11-multimc.zip).
    - Right-click the instance in Prism -> **Folder**.
    - Extract the ZIP into this folder, overwriting `mmc-pack.json`.
4.  Configure your instance to use **Java 25** and add the recommended JVM flags:
    - **4G+ RAM**: Use flags from `overrides/java9args_4G.txt` (Optimized for ZGC).
    - **Low RAM**: Use flags from `overrides/java9args.txt` (Optimized for G1GC).

## Contents
- **GregTech 6** (Core)
- **IndustrialCraft 2 Experimental**
- **Angelica** (Sodium port)
- **NEI (GTNH Fork)**
- **BetterQuesting** (Bear's Den Configs)
- **JourneyMap**, **Waila**, **GraveStone**, **Better Storage**
- **QoL**: Inventory Tweaks, Mouse Tweaks, Controlling, ServerUtilities.

## Server-Side Optimization & Tools

### World Pregeneration
Prevent lag during exploration by generating chunks in advance:
- **Overworld** (5000x5000): `/pregen start gen radius Overworld SQUARE 0 0 157 0 FAST_CHECK_GEN`
- **Nether** (624x624): `/pregen start gen radius Nether SQUARE 0 0 20 -1 FAST_CHECK_GEN`

### World Borders (Elsewhere Border)
Set borders in `config/elsewhereborder.cfg` using the format `[DimensionID]:[Radius]` (e.g., `0:1000` for a 2000x2000 Overworld area).

## Mod-Specific Configuration Notes

### NEI Tooltip Search (GregTech 6)
- **Issue**: Searching for materials by their tooltip (e.g., "Fortune") in NEI fails.
- **Fix**: In `config/archaicfix.cfg`, set `B:hideGT6TooltipDataBehindKey=false`. This ensures GT6 data is visible to NEI's background indexing thread.

### Hardware Compatibility (SIGILL Fix)
- **Problem**: Old CPUs (pre-2012) crash in `liblwjgl_spng.so`.
- **Fix**: In `config/lwjgl3ify.cfg`, set `B:stbiTextureLoading=false` and `B:stbiTextureStitching=false`.

## Maintenance
- **Reindexing**: Run `packwiz refresh` after any manual changes to `config/` or `mods/`.
- **Mod Updates**: Use `packwiz update --all`.
