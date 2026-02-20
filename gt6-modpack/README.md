# GT6: Modernized (Source)

This directory contains the core modpack source files managed by `packwiz`.

## Design Philosophy
1.  **Gregified Vanilla**: A GregTech 6 experience focused on physical systems and industrial progression.
2.  **Modern Runtime**: Optimized for Java 17-25 and LWJGL 3.
3.  **Performance**: Includes Angelica (Sodium), ArchaicFix, and Hodgepodge for high-FPS gameplay.

## Installation (Client)

### 1. Requirements
- **Prism Launcher** (Recommended)
- **Java 25**

### 2. Setup
1.  Export the pack using `packwiz curseforge export` (from this directory).
2.  Import the resulting ZIP into your launcher.
3.  **LWJGL 3 Patch**: Download [lwjgl3ify-3.0.11-multimc.zip](https://github.com/GTNewHorizons/lwjgl3ify/releases/download/3.0.11/lwjgl3ify-3.0.11-multimc.zip) and extract it into your instance folder, overwriting `mmc-pack.json`.
4.  Configure your instance to use **Java 25** and add the recommended JVM flags found in `overrides/java9args.txt`.

## Contents
- **GregTech 6** (Core)
- **IndustrialCraft 2 Experimental**
- **Angelica** (Sodium port)
- **NEI (GTNH Fork)**
- **BetterQuesting** (Bear's Den Configs)
- **JourneyMap**, **Waila**, **GraveStone**, **Better Storage**
- **Pam's HarvestCraft**, **Cooking for Blockheads**, **Chisel**, **Carpenter's Blocks**

## Maintenance
- **Reindexing**: Run `packwiz refresh` after any manual changes to `config/` or `mods/`.
- **Mod Updates**: Use `packwiz update --all`.
