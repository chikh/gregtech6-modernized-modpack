# AI Context: GT6 Maintainable Modpack

## Project Overview
- **Name**: GT6 Maintainable Pack
- **Version**: 1.0.0
- **Minecraft Version**: 1.7.10
- **Modloader**: Forge (10.13.4.1614)
- **Primary Tool**: `packwiz` (Binary: `~/.aur/packwiz-git/packwiz`)

## Mod List & Sources
- **GregTech 6**: Added via URL (https://gregtech.overminddl1.com/1.7.10/6.17.06/gregtech_1.7.10-6.17.06.jar)
- **IndustrialCraft 2 Experimental**: CurseForge (industrialcraft-2)
- **NEI Fork (GTNH)**: NotEnoughItems-GTNH (includes JEI-style tabs, high performance, and bookmarks).
- **NEI Dependencies (GTNH)**: CodeChickenCore Unofficial, CodeChickenLib Unofficial.
- **Performance**: Angelica (Sodium port), ArchaicFix, FastCraft, BetterFps.
- **Modern Java Compatibility**: FalsePatternLib, GTNH Lib, UniMixins. (Optimized for Java 17/21).
- **QoL**: Waila, Waila Harvestability, JourneyMap, Mouse Tweaks, Inventory Tweaks, Controlling, AppleCore, NEI Addons.

## Maintenance Procedures
- **Adding Mods**: Use `packwiz curseforge add [slug]` or `packwiz url add [name] [url]`.
- **Updating**: Use `packwiz update --all` or `packwiz update [mod-name]`.
- **Refreshing Index**: Always run `packwiz refresh` after manual changes to metadata files.
- **Exporting**: Use `packwiz curseforge export` to generate a CurseForge-compatible `.zip` for launchers.

## Directory Structure
- `pack.toml`: Main project configuration.
- `index.toml`: Mod file index and hash manifest.
- `mods/`: Contains `.pw.toml` metadata files for each mod.
- `README.md`: Human-readable overview.
- `AI_CONTEXT.md`: This file.

## Developer Notes
- GregTech 6 is hosted externally; updates must be checked manually at `https://gregtech.overminddl1.com/1.7.10/`.
- Packwiz allows for easy Git integration for version control of the modpack metadata.

## AI Maintenance & Updates
Any AI assisting with this project MUST update this file whenever:
1.  **New mods are added**: Update the "Mod List & Sources" section.
2.  **Mod versions are updated**: Specifically for manually-added URLs like GregTech 6.
3.  **Core versions change**: If Minecraft or Forge versions are updated in `pack.toml`.
4.  **Maintenance procedures change**: If the workflow or tools (e.g., location of `packwiz`) are updated.
5.  **Project structure changes**: If new directories or critical files are introduced.
