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
- **Performance**: FastCraft, BetterFps
- **QoL**: NotEnoughItems (NEI), Waila, Waila Harvestability, JourneyMap, Mouse Tweaks, Inventory Tweaks, Controlling, AppleCore, NEI Addons.
- **Dependencies**: CodeChickenCore (automatically handled by packwiz for NEI).

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
