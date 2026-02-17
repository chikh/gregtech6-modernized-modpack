# AI Context: GT6 Maintainable Modpack

## Design Philosophy (Core Pillars)
Any AI assisting with this project MUST adhere to these principles when suggesting mods or changes:
1.  **Gregified Vanilla**: The pack should feel like "Vanilla + GT6". Suggest mods that enhance the physical, industrial feel of GT6 (like Better Storage). Avoid mods that add "magic" blocks, teleportation, or sci-fi UI elements that clash with GT6's gritty, realistic progression.
2.  **Low-End Hardware & Runtime Optimization**: Every mod added must be analyzed for its performance impact. Prioritize performance mods (like Angelica) and avoid mods known for heavy RAM usage or tick-lag. Furthermore, maintain and suggest the most efficient runtime settings (Java 25, LWJGL 3, and pre-configured JVM flags like Generational ZGC).
3.  **Bear's Den Inspiration**: The pack is inspired by the **Bear's Den GT6 Survival Season 3** modpack. Aim for a similar "realistic industry" vibe but prioritized for modern Java and ease of maintenance.

## Project Overview
- **Name**: GT6 Maintainable Pack
- **Version**: 1.0.0
- **Minecraft Version**: 1.7.10
- **Modloader**: Forge (10.13.4.1614)
- **Primary Tool**: `packwiz` (Binary: `~/.aur/packwiz-git/packwiz`)
- **Core Config**: Includes GregTech 6 "Default Config Pack" to ensure correct worldgen and mod balancing.

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

- **QoL**: Waila, Waila Harvestability, JourneyMap, GraveStone Mod, Better Storage (GTNH Edition), GT6 Ore Helper, Better Questing (with Bear's Den configs), Cooking for Blockheads, Pam's HarvestCraft, Chisel, Carpenter's Blocks, ChunkPregenerator (Server-side), ServerUtilities (GTNH Fork, Server-side), Mouse Tweaks, Inventory Tweaks, Controlling, AppleCore, NEI Addons.

## Maintenance Procedures
- **Adding Mods**: Use `packwiz curseforge add [slug]` or `packwiz url add [name] [url]`.
- **Updating**: Use `packwiz update --all` or `packwiz update [mod-name]`.
- **Refreshing Index**: Always run `packwiz refresh` after manual changes to metadata files.
- **Exporting (Client)**: Use `packwiz curseforge export` to generate a CurseForge-compatible `.zip` for launchers.
- **Exporting (Server)**: Use `packwiz curseforge export --side server -o server-pack.zip` to create a server-appropriate artifact.

## Directory Structure
- `pack.toml`: Main project configuration.
- `index.toml`: Mod file index and hash manifest.
- `mods/`: Contains `.pw.toml` metadata files for each mod.
- `README.md`: Human-readable overview.
- `AI_CONTEXT.md`: This file.

## Recommended Setup: Prism Launcher + Java 25
For full Java 25 compatibility on 1.7.10, the following setup is mandatory:
1. **Prism Instance**: Create via `packwiz curseforge export` zip.
2. **LWJGL 3 Patch**: Download and extract [lwjgl3ify-3.0.11-multimc.zip](https://github.com/GTNewHorizons/lwjgl3ify/releases/download/3.0.11/lwjgl3ify-3.0.11-multimc.zip) into the instance folder, overwriting `mmc-pack.json`.
3. **Java**: Use Java 25 with the recommended JVM flags below.
4. **Mods**: Ensure `lwjgl3ify.jar`, `archaicfix.jar`, `hodgepodge.jar`, `angelica.jar`, and `unimixins.jar` are present in `mods/`.

## Mandatory Server Setup (Docker/Custom)
1. **Build Artifact**: Run `./build_server.sh` inside the modpack folder to create a `server-bundle.zip` (located in the parent directory) containing all actual mod JARs and `java9args.txt`.
2. **Docker TYPE**: Use `TYPE=CUSTOM` in `itzg/minecraft-server`.
3. **Launch Entry**: Set `CUSTOM_SERVER=lwjgl3ify-forgePatches.jar`.
4. **Java Args**: Load all mandatory flags (module access + Generational ZGC) via `JVM_OPTS: "@java9args.txt ..."`.

## Developer Notes
- GregTech 6 is hosted externally; updates must be checked manually at `https://gregtech.overminddl1.com/1.7.10/`.
- Packwiz allows for easy Git integration for version control of the modpack metadata.

## Git Commit Guidelines
Any AI assisting with this project MUST create git commits after performing significant changes (adding/removing mods, updating configs, updating docs).
- **Staging**: Always use `git add .` to ensure all metadata and config changes are tracked.
- **Messages**: Commit messages should be concise and descriptive (e.g., "Add Pam's HarvestCraft and update README").
- **Atomic Commits**: Prefer smaller, focused commits for distinct tasks (e.g., one commit for a new mod addition, another for config tweaks).

## AI Maintenance & Updates
Any AI assisting with this project MUST update this file whenever:
1.  **New mods are added**: Update the "Mod List & Sources" section.
2.  **Mod versions are updated**: Specifically for manually-added URLs like GregTech 6.
3.  **Core versions change**: If Minecraft or Forge versions are updated in `pack.toml`.
4.  **Maintenance procedures change**: If the workflow or tools (e.g., location of `packwiz`) are updated.
5.  **Project structure changes**: If new directories or critical files are introduced.

**Mandatory Cross-Check**: 
Before adding or updating ANY mod or configuration, always cross-check with the **Official GregTech 6 Requirements & Compatibility Page**:
`https://gregtech.overminddl1.com/downloads/gregtech_1.7.10/index.html`
Ensure all IC2 build requirements, mod forks (GTNH versions preferred), and mandatory config tweaks (e.g., FastCraft, ForgeMultipart) are strictly adhered to.
