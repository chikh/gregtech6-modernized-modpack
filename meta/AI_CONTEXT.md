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
    - `icon.png`: Launcher icon.
    - `java9args.txt`: JVM arguments for modern Java.
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
- **Updating Default Configs**: Run `./scripts/update_configs.sh` from the root to sync with official GregTech 6 default configurations.
- **Building Server**: Run `./scripts/build_server.sh` from the root.
- **Exporting Client**: Run `./scripts/export_client.sh` from the root.

## Mod List & Critical Sources
- **GregTech 6**: URL: `https://github.com/chikh/gregtech6/releases/download/v6.17.06-m1/gregtech_1.7.10-6.17.06-m1.jar` (Modernized fork)
- **IndustrialCraft 2 Experimental**: CurseForge: `industrialcraft-2`
- **BetterQuesting (GTNH)**: URL: `https://github.com/GTNewHorizons/BetterQuesting/releases/download/3.8.28-GTNH/BetterQuesting-3.8.28-GTNH.jar`
- **NEI (GTNH Fork)**: `NotEnoughItems-GTNH` (JEI-style tabs).
- **Wawla**: CurseForge: `wawla` (Enhanced info for Waila).
- **Performance/Fixes**: Angelica, ArchaicFix, LWJGL3ify, Hodgepodge, FastCraft, BetterFps, FalsePatternLib, GTNH Lib, UniMixins.

## Hardware Compatibility (SIGILL Fix)
- **Problem**: Old CPUs (pre-2012) crash in `liblwjgl_spng.so`.
- **Fix**: In `config/lwjgl3ify.cfg`, set `B:stbiTextureLoading=false` and `B:stbiTextureStitching=false`.

## Recommended JVM Flags (Java 17-25)
Required for module access and optimal GC:
```bash
--add-opens java.base/java.io=ALL-UNNAMED --add-opens java.base/java.lang=ALL-UNNAMED --add-opens java.base/java.lang.reflect=ALL-UNNAMED --add-opens java.base/java.net=ALL-UNNAMED --add-opens java.base/java.nio=ALL-UNNAMED --add-opens java.base/java.security=ALL-UNNAMED --add-opens java.base/java.text=ALL-UNNAMED --add-opens java.base/java.util=ALL-UNNAMED --add-opens java.base/java.util.concurrent=ALL-UNNAMED --add-opens java.base/java.util.zip=ALL-UNNAMED --add-opens java.base/sun.nio.ch=ALL-UNNAMED --add-opens java.base/sun.security.action=ALL-UNNAMED --add-opens java.base/sun.security.util=ALL-UNNAMED --add-opens java.desktop/java.awt=ALL-UNNAMED --add-opens java.desktop/java.awt.color=ALL-UNNAMED --add-opens java.desktop/java.awt.desktop=ALL-UNNAMED --add-opens java.desktop/java.awt.dnd=ALL-UNNAMED --add-opens java.desktop/java.awt.event=ALL-UNNAMED --add-opens java.desktop/java.awt.font=ALL-UNNAMED --add-opens java.desktop/java.awt.geom=ALL-UNNAMED --add-opens java.desktop/java.awt.im=ALL-UNNAMED --add-opens java.desktop/java.awt.image=ALL-UNNAMED --add-opens java.desktop/java.awt.image.renderable=ALL-UNNAMED --add-opens java.desktop/java.awt.print=ALL-UNNAMED --add-opens java.desktop/sun.awt.image=ALL-UNNAMED --add-opens java.desktop/sun.awt=ALL-UNNAMED --add-opens java.desktop/sun.font=ALL-UNNAMED --add-opens java.desktop/sun.print=ALL-UNNAMED --add-opens java.naming/javax.naming=ALL-UNNAMED --enable-native-access=ALL-UNNAMED -XX:+UseZGC -XX:+UnlockExperimentalVMOptions
```

## Git & AI Maintenance Rules
1.  **Commits**: Create atomic, descriptive git commits after significant changes.
2.  **Tracking**: Only track `gt6-modpack/`, `scripts/`, `meta/`, and `docker/`. NEVER track `bin-cache/` or `builds/`.
3.  **Self-Update**: Update this `AI_CONTEXT.md` whenever new mods are added, core versions change, or project structure evolves.
4.  **Mandatory Cross-Check**: Before adding/updating mods, cross-check with the **Official GT6 Requirements Page**: `https://gregtech.overminddl1.com/downloads/gregtech_1.7.10/index.html`.
