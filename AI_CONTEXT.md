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
- **Performance**: Angelica (Sodium port), ArchaicFix, LWJGL3ify, Hodgepodge, FastCraft, BetterFps.
- **Modern Java Compatibility**: FalsePatternLib, GTNH Lib, UniMixins. (Optimized for Java 17, 21, and 25).

## Recommended JVM Flags (Java 17-25)
Required to bypass module encapsulation and for optimal GC performance:
```bash
--add-opens java.base/java.io=ALL-UNNAMED --add-opens java.base/java.lang=ALL-UNNAMED --add-opens java.base/java.lang.reflect=ALL-UNNAMED --add-opens java.base/java.net=ALL-UNNAMED --add-opens java.base/java.nio=ALL-UNNAMED --add-opens java.base/java.security=ALL-UNNAMED --add-opens java.base/java.text=ALL-UNNAMED --add-opens java.base/java.util=ALL-UNNAMED --add-opens java.base/java.util.concurrent=ALL-UNNAMED --add-opens java.base/java.util.zip=ALL-UNNAMED --add-opens java.base/sun.nio.ch=ALL-UNNAMED --add-opens java.base/sun.security.action=ALL-UNNAMED --add-opens java.base/sun.security.util=ALL-UNNAMED --add-opens java.desktop/java.awt=ALL-UNNAMED --add-opens java.desktop/java.awt.color=ALL-UNNAMED --add-opens java.desktop/java.awt.desktop=ALL-UNNAMED --add-opens java.desktop/java.awt.dnd=ALL-UNNAMED --add-opens java.desktop/java.awt.event=ALL-UNNAMED --add-opens java.desktop/java.awt.font=ALL-UNNAMED --add-opens java.desktop/java.awt.geom=ALL-UNNAMED --add-opens java.desktop/java.awt.im=ALL-UNNAMED --add-opens java.desktop/java.awt.image=ALL-UNNAMED --add-opens java.desktop/java.awt.image.renderable=ALL-UNNAMED --add-opens java.desktop/java.awt.print=ALL-UNNAMED --add-opens java.desktop/sun.awt.image=ALL-UNNAMED --add-opens java.desktop/sun.awt=ALL-UNNAMED --add-opens java.desktop/sun.font=ALL-UNNAMED --add-opens java.desktop/sun.print=ALL-UNNAMED --add-opens java.naming/javax.naming=ALL-UNNAMED --enable-native-access=ALL-UNNAMED -XX:+UseZGC -XX:+ZGenerational -XX:+UnlockExperimentalVMOptions
```

- **QoL**: Waila, Waila Harvestability, JourneyMap, GraveStone Mod, Better Storage (GTNH Edition), Mouse Tweaks, Inventory Tweaks, Controlling, AppleCore, NEI Addons.

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
- **Recommended Setup**: Prism Launcher + Java 25 + LWJGL3ify (included) + Generational ZGC.
- **Mandatory LWJGL 3 Patch**: Download [lwjgl3ify-3.0.11-multimc.zip](https://github.com/GTNewHorizons/lwjgl3ify/releases/download/3.0.11/lwjgl3ify-3.0.11-multimc.zip) and extract it to the instance folder (overwrite `mmc-pack.json`) to correctly enable LWJGL 3 on 1.7.10.

## AI Maintenance & Updates
Any AI assisting with this project MUST update this file whenever:
1.  **New mods are added**: Update the "Mod List & Sources" section.
2.  **Mod versions are updated**: Specifically for manually-added URLs like GregTech 6.
3.  **Core versions change**: If Minecraft or Forge versions are updated in `pack.toml`.
4.  **Maintenance procedures change**: If the workflow or tools (e.g., location of `packwiz`) are updated.
5.  **Project structure changes**: If new directories or critical files are introduced.
