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
The modpack is configured to reward culinary variety and discourage repetitive eating, aligning with the realism of GregTech 6.

- **Variety History**: The last **32 items** eaten are tracked. Eating the same food repeatedly will drastically reduce its nutritional value (hunger and saturation restoration).
- **Hardcore Persistence**: Nutrition history **persists through death**. You cannot reset your diet by dying; true survival requires maintaining a diverse food supply.
- **Categorized Groups**: Related foods are grouped together (e.g., all Canned Meats, all Breads). 
- **Strategic Rotation (Overlapping Tags)**: Complex foods like Sandwiches may belong to multiple groups (e.g., Meals + Grains + Proteins). Eating a Steak Sandwich will simultaneously diminish the returns for all three categories. 
    - **Pro-Tip**: Balance "Heavy" multi-category meals with "Light" single-category snacks (like individual Fruits or Dairy) to let your main meal categories recover.
- **Health Rewards**: Eating unique foods progress you towards permanent **Extra Hearts**. Check your Food Journal to track your milestones.

## Server-Side Optimization & Tools

### World Pregeneration
Prevent lag during exploration by generating chunks in advance. The radius is specified in **chunks** (`world_radius / 16`).
- **Overworld** (6400x6400 area, 3200 radius): `/pregen start gen radius Overworld SQUARE 0 0 200 0 FAST_CHECK_GEN`
- **Nether** (800x800 area, 400 radius): `/pregen start gen radius Nether SQUARE 0 0 25 -1 FAST_CHECK_GEN`

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
