# AI Context: GT6: Modernized

## Project Identity
- **Official Name**: GT6: Modernized
- **Root Directory**: `gt6-modernized`
- **Source Directory**: `gt6-modpack`
- **Branding**: `meta/logo.png` (High-res), `gt6-modpack/overrides/icon.png` (Launcher icon).
- **Logo Prompt**: "A high-resolution, minimalist 2D logo for a Minecraft modpack named 'GT6: Modernized'. The logo features a sleek, metallic silver wrench silhouette. Centered inside the wrench is a glowing bronze rectangular ingot with sharp edges. The background is a dark navy blue blueprint style with thin, glowing cyan digital circuit lines. Industrial, technical, clean, professional."

## Design Philosophy (Core Pillars)
Any AI assisting with this project MUST adhere to these principles:
1.  **Gregified Vanilla**: Feel like "Vanilla + GT6". Suggest mods enhancing physical/industrial feel (e.g., Better Storage). Avoid "magic" blocks or teleportation.
2.  **Runtime Optimization**: Prioritize performance (Angelica, ArchaicFix). Maintain support for modern Java (17-25) and LWJGL 3.
3.  **Bear's Den Inspiration**: Realistic industry vibe prioritized for modern performance.

## Project Workspace Structure
- **`/gt6-modpack/`**: The "Source Code". (Managed by `packwiz`).
    - `overrides/`: Root-level Minecraft files (e.g., `icon.png`, `java9args.txt`).
    - `mods/`: Mod metadata files (`.pw.toml`).
    - `config/`: Mod configurations.
- **`/scripts/`**: Automation tools (`build_server.sh`, `update_quests.sh`).
- **`/meta/`**: Metadata, branding, and this `AI_CONTEXT.md`.
- **`/bin-cache/`**: (Ignored) Binary downloads (Forge, packwiz bootstrap).
- **`/builds/`**: (Ignored) Exported artifacts.
- **`/docker/`**: Deployment configurations.

## Maintenance Procedures
- **Mandatory Reindexing**: After ANY file changes in `gt6-modpack/`, run `~/.aur/packwiz-git/packwiz refresh` inside that directory.
- **Adding Mods**: Use `packwiz curseforge add [slug]` or `packwiz url add [name] [url]`.
- **Updating Modpack**: Run `packwiz update --all` inside `gt6-modpack/`.
- **Updating Quest Book**: Run `./scripts/update_quests.sh` from the root.
- **Building Server**: Run `./scripts/build_server.sh` from the root.

## Mod List & Critical Sources
- **GregTech 6**: URL: `https://gregtech.overminddl1.com/1.7.10/6.17.06/gregtech_1.7.10-6.17.06.jar`
- **BetterQuesting (GTNH)**: URL: `https://github.com/GTNewHorizons/BetterQuesting/releases/download/3.8.28-GTNH/BetterQuesting-3.8.28-GTNH.jar`
- **Performance/Fixes**: Angelica, ArchaicFix, LWJGL3ify, Hodgepodge, FastCraft, BetterFps, FalsePatternLib, GTNH Lib, UniMixins.

## Hardware Compatibility (SIGILL Fix)
- **Problem**: Old CPUs (pre-2012) crash in `liblwjgl_spng.so`.
- **Fix**: In `config/lwjgl3ify.cfg`, set `B:stbiTextureLoading=false` and `B:stbiTextureStitching=false`.

## Recommended JVM Flags (Java 17-25)
Required for module access and optimal GC:
```bash
--add-opens java.base/java.io=ALL-UNNAMED --add-opens java.base/java.lang=ALL-UNNAMED --add-opens java.base/java.lang.reflect=ALL-UNNAMED --add-opens java.base/java.net=ALL-UNNAMED --add-opens java.base/java.nio=ALL-UNNAMED --add-opens java.base/java.security=ALL-UNNAMED --add-opens java.base/java.text=ALL-UNNAMED --add-opens java.base/java.util=ALL-UNNAMED --add-opens java.base/java.util.concurrent=ALL-UNNAMED --add-opens java.base/java.util.zip=ALL-UNNAMED --add-opens java.base/sun.nio.ch=ALL-UNNAMED --enable-native-access=ALL-UNNAMED -XX:+UseZGC -XX:+UnlockExperimentalVMOptions
```

## Git & AI Maintenance Rules
1.  **Commits**: Create atomic, descriptive git commits after significant changes.
2.  **Tracking**: Only track `gt6-modpack/`, `scripts/`, `meta/`, and `docker/`. NEVER track `bin-cache/` or `builds/`.
3.  **Self-Update**: Update this `AI_CONTEXT.md` whenever new mods are added, core versions change, or project structure evolves.
