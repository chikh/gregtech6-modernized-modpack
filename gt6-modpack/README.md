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
- **Et Futurum Requiem** (Modern backports)
- **Netherlicious** (Nether overhaul)
- **Angelica** (Sodium port)
- **NEI (GTNH Fork)**
- **BetterQuesting** (Bear's Den Configs)
- **JourneyMap**, **Waila**, **GraveStone**, **Better Storage**
- **QoL**: Inventory Tweaks, Mouse Tweaks, Controlling, ServerUtilities.

## Survival Mechanics

### Balanced Diet & Nutrition (Spice of Life)
The modpack is configured with a nutritional balance system that rewards dietary diversity and encourages the use of GregTech 6 food processing.

- **Variety History**: The last **24 items** eaten are tracked.
- **Grace Period**: You can eat the same food group **5 times** (roughly 2 days of meals) with **zero penalty**. This allows you to eat a "stack" of the same food during a long trip or combat without an immediate penalty.
- **Variety Reward**: Maintaining **6 different food groups** in your history awards **100% nutrition**. 
- **Monodiet Penalty**: Eating only **one group** (e.g., nothing but Steak) reduces your base nutrition to **~34%** as your body craves other essential nutrients.
- **Heavy vs. Light**: Large, filling meals (8+ hunger) are more satisfying but decay faster in your variety history than light snacks (2-4 hunger), which can be eaten more frequently as staple foods.
- **Strategic Rotation**: Complex GT6 foods (Sandwiches, Pizzas) hit multiple categories at once. This fills your "Variety Target" quickly but also uses up those specific categories faster.
- **Nutritional Floor**: Food never drops below **25%** of its original value. You will never be unable to eat, but a poor diet will be very inefficient.
- **Hardcore Persistence**: Nutrition history **persists through death**. You cannot reset your diet by dying.
- **Health Rewards**: Eating unique foods progresses you towards permanent **Extra Hearts**.

## Server-Side Optimization & Tools

### World Pregeneration
Prevent lag during exploration by generating chunks in advance. The radius is specified in **chunks** (`(world_radius / 16) + 10`). The +10 chunks buffer accommodates for average view distance.

**CRITICAL WARNING (RTG Compatibility):**
Speiger's **ChunkPregenerator** is currently **incompatible** with the "Population" (decoration) phase of **RTG** in Minecraft 1.7.10. Using it for an **RTG world type** will result in "naked" terrain (no trees, no RTG boulders). Only use this pregenerator for non-RTG dimensions or world types.

- **Overworld (Non-RTG)**: `/pregen start gen radius Overworld SQUARE 0 0 210 0 FAST_CHECK_GEN`
- **Nether**: `/pregen start gen radius Nether SQUARE 0 0 35 -1 FAST_CHECK_GEN`

### World Borders (Elsewhere Border)
Set borders in `config/elsewhereborder.cfg` using the format `[DimensionID]:[Radius]` (e.g., `0:3200` for a 6400x6400 Overworld area).
- **Unlimited Mode**: To remove the border, delete the entries in `elsewhereborder.cfg` or set the radius to `30000000`.

### Random Teleport (RTP)
To ensure the `/rtp` command doesn't teleport players outside the world border, update `D:rtp_max_distance` in `config/serverutilities/serverutilities.cfg`.

### Climate Control & Latitude-based Banding
The modpack is configured for realistic climate banding (latitudinal climates), where cold biomes are found at the "poles" and hot biomes near the "equator" (Z=0).

- **Climate Banding Width**: Controlled by `I:bandedClimateWidth` in `config/climatecontrol.cfg`.
    - 1 unit $\approx$ 3.1k blocks of Z-distance (with `I:"Biome Size"=4`).
    - The default value of `2` ($\approx$ 6.2k blocks cycle) aligns with the suggested 3200-block radius.
- **Climate Banding Offset**: Use `I:bandedClimateOffset` to shift the bands if the equator is not centered.

#### Tweak & Preview
**ForgeAmidst** (for Minecraft 1.7.10) can be used to quickly generate world previews. This is highly recommended for testing different `ClimateControl` configurations and verifying biome distribution before starting a long-term world.

## Mod-Specific Configuration Notes

### NEI Tooltip Search (GregTech 6)
- **Issue**: Searching for materials by their tooltip (e.g., "Fortune") in NEI fails.
- **Fix**: In `config/archaicfix.cfg`, set `B:hideGT6TooltipDataBehindKey=false`. This ensures GT6 data is visible to NEI's background indexing thread.

### Troubleshooting: Hardware Compatibility (SIGILL)
- **Problem**: Old CPUs (pre-2012, e.g., AMD Phenom II, Intel Core 2 Duo) crash in `liblwjgl_spng.so`.
- **Manual Fix**: If experiencing this specific crash, the user must manually edit `config/lwjgl3ify.cfg` and set `B:stbiTextureLoading=false` and `B:stbiTextureStitching=false`. **Default to `true` for performance on modern hardware.**

## Maintenance
- **Reindexing**: Run `packwiz refresh` after any manual changes to `config/` or `mods/`.
- **Mod Updates**: Use `packwiz update --all`.
