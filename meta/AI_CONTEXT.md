# AI Context: GT6: Modernized

## Project Identity
- **Official Name**: GT6: Modernized
- **Version**: Minecraft 1.7.10 (Forge 10.13.4.1614)
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
- **Documentation Scope**:
    - `meta/AI_CONTEXT.md`: This file (Source of Truth).
    - `README.md`: High-level modpack overview and repository guide.
    - `gt6-modpack/README.md`: In-depth user guide (installation, survival mechanics, and detailed pregeneration commands).
    - `MODPACK_ASSESSMENT.md`: Rationale for mod selection and biome choices.
    - `gt6-modpack/pack.toml`: Main modpack metadata.
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
- **Mandatory Reindexing**: After ANY file changes in `gt6-modpack/`, run `packwiz refresh` inside that directory.
- **Adding Mods**: Use `packwiz curseforge add [slug]` or `packwiz url add [name] [url]`.
- **Updating Modpack**:
    - CurseForge/Modrinth: `cd gt6-modpack && packwiz update --all`
    - URL/GitHub-sourced: `bash scripts/update_url_mods.sh`
- **Update Quest Book**: `bash scripts/update_quests.sh` (Syncs from Bear's Den).
- **Update Configs**: `bash scripts/update_configs.sh` (Syncs with GT6 defaults).
- **Building Server**: `bash scripts/build_server.sh`
    - `--pregen`: Excludes ArchaicFix and optimizes Hodgepodge for initial world pregeneration (includes Chunk-Pregenerator).
    - `--pregen-fast`: All `--pregen` optimizations plus high-speed Chunk-Pregenerator settings. **Warning**: Server will be unplayable during pregen.
    - `--pregen-rtg`: Includes Admin Commands Toolbox (ACT) specifically for RTG dimension pregeneration. **Recommended for Overworld**.
    - `--java-4g`: Optimizes for 4G+ RAM using ZGC flags.

### Pregeneration Guide
Depending on the world type and dimension, use the appropriate pregenerator:

#### 1. Overworld (RTG) - Recommended
Use the `--pregen-rtg` build to include **Admin Commands Toolbox (ACT)**. 
- **Why**: ACT is more compatible with RTG's decoration phase, ensuring trees, ores, and villages spawn correctly in the Overworld.
- **Commands**: 
    - `/pregenspawn <radius_in_chunks>` (e.g., `/pregenspawn 200` for ~3200 block radius).
    - `/pregen <dim> <minX> <maxX> <minZ> <maxZ>` (Uses chunk coordinates).

#### 2. Other Dimensions (Nether, etc.)
Use the `--pregen` or `--pregen-fast` build to include **Chunk-Pregenerator (Speiger)**.
- **Why**: Much faster and multi-threaded; ideal for dimensions without complex RTG-style decoration.
- **Commands**:
    - `/pregen gen startradius square 0 0 <radius_in_chunks>`

**Important**: Always restart the server after a large pregen session to clear memory leaks common in 1.7.10.
- **Exporting Client**: `bash scripts/export_client.sh` (Generates CurseForge-compatible ZIP).

## World Configuration & Climate Control
The modpack uses a "Limited World" philosophy by default to ensure realistic biome distribution and performance.

### World Size & Borders
- **Standard Radius**: 3200 blocks (6400x6400 total area).
- **Configuration**:
    - **Elsewhere Border**: Set in `config/elsewhereborder.cfg` (e.g., `0:3200x3200` for Overworld).
    - **Random Teleport (RTP)**: Set `D:rtp_max_distance=3200.0` in `config/serverutilities/serverutilities.cfg`.
    - **Pregeneration**: Radius in chunks (`world_radius / 16 + 10`). For 3200 radius, use `210` in the 7th parameter of the `/pregen` command. **WARNING**: Incompatible with RTG decoration phase; use only for non-RTG dimensions.
- **Unlimited Mode**: To remove the border, delete the entries in `elsewhereborder.cfg` or set the radius to `30000000`. Set `rtp_max_distance` to a high value.

### Climate Banding (Earth-like World)
Climate Control is configured to generate horizontal climate bands (latitudes).
- **Banded Climate Width**: Controlled by `I:bandedClimateWidth` in `config/climatecontrol.cfg`.
    - **Math**: 1 unit $\approx$ 3.1k blocks of Z-distance (with `I:"Biome Size"=4`).
    - **Current Setting**: `2` ($\approx$ 6.2k blocks for a full Snowy -> Hot -> Snowy cycle). This aligns perfectly with a 3200 radius, placing Snowy biomes at the poles and Hot biomes near the equator (Z=0).
- **Banded Climate Offset**: `I:bandedClimateOffset` shifts the bands. Adjust this if the equator is not centered at Z=0.

## Mod List & Critical Sources
- **GregTech 6**: URL: `https://github.com/chikh/gregtech6/releases/download/v6.17.06-m1/gregtech_1.7.10-6.17.06-m1.jar` (Modernized fork)
- **IndustrialCraft 2 Experimental**: CurseForge: `industrialcraft-2`
- **BetterQuesting (GTNH)**: URL: `https://github.com/GTNewHorizons/BetterQuesting/releases/download/3.8.28-GTNH/BetterQuesting-3.8.28-GTNH.jar`
- **NEI (GTNH Fork)**: `NotEnoughItems-GTNH` (JEI-style tabs).
- **Wawla**: CurseForge: `wawla` (Enhanced info for Waila).
- **GT6 Ore Helper**: URL: `https://github.com/chikh/GT6-Ore-Helper/releases/download/1.7.10-0.0.5-p1/GT6OreHelper-1.7.10-0.0.5-p1.jar` (Custom fork)
- **Et Futurum Requiem**: Modrinth: `etfuturum` (Backports from modern MC).
- **Backhand**: CurseForge: `backhand` (Backports offhand slot).
- **Spice of Life (GTNH)**: GitHub: `GTNewHorizons/SpiceOfLife` (Carrot Edition).
- **Punch Me Not**: CurseForge: `punch-me-not` (Enforces tool use by damaging players who punch blocks).
- **EnviroMine**: CurseForge: `enviromine` (Adds survival realism: temperature, hydration, air quality, and sanity).
- **Netherlicious**: CurseForge: `netherlicious` (Comprehensive Nether overhaul).
- **ExtrabiomesXL**: CurseForge: `extrabiomesxl` (Realistic biome diversity and terrain).
- **Performance/Fixes**: Angelica, ArchaicFix, LWJGL3ify, Hodgepodge, FastCraft, BetterFps, FalsePatternLib, GTNH Lib, UniMixins.

## Troubleshooting: Hardware Compatibility (SIGILL)
- **Problem**: Old CPUs (pre-2012, e.g., AMD Phenom II, Intel Core 2 Duo) crash in `liblwjgl_spng.so`.
- **Manual Fix**: If experiencing this specific crash, the user must manually edit `config/lwjgl3ify.cfg` and set `B:stbiTextureLoading=false` and `B:stbiTextureStitching=false`. **Default to `true` for performance on modern hardware.**

## Mod Compatibility (NEI Search Fix)
- **Problem**: NEI tooltip search (e.g., searching for "Fortune") fails to find GregTech 6 materials.
- **Cause**: ArchaicFix's `hideGT6TooltipDataBehindKey` defaults to `true`, which hides GT6 data from background indexing.
- **Fix**: In `config/archaicfix.cfg`, set `B:hideGT6TooltipDataBehindKey=false`.

## Recommended JVM Flags (Java 17-25)
Required for module access and optimal GC:
```bash
--add-opens java.base/java.io=ALL-UNNAMED --add-opens java.base/java.lang=ALL-UNNAMED --add-opens java.base/java.lang.reflect=ALL-UNNAMED --add-opens java.base/java.net=ALL-UNNAMED --add-opens java.base/java.nio=ALL-UNNAMED --add-opens java.base/java.security=ALL-UNNAMED --add-opens java.base/java.text=ALL-UNNAMED --add-opens java.base/java.util=ALL-UNNAMED --add-opens java.base/java.util.concurrent=ALL-UNNAMED --add-opens java.base/java.util.zip=ALL-UNNAMED --add-opens java.base/sun.nio.ch=ALL-UNNAMED --add-opens java.base/sun.security.action=ALL-UNNAMED --add-opens java.base/sun.security.util=ALL-UNNAMED --add-opens java.desktop/java.awt=ALL-UNNAMED --add-opens java.desktop/java.awt.color=ALL-UNNAMED --add-opens java.desktop/java.awt.desktop=ALL-UNNAMED --add-opens java.desktop/java.awt.dnd=ALL-UNNAMED --add-opens java.desktop/java.awt.event=ALL-UNNAMED --add-opens java.desktop/java.awt.font=ALL-UNNAMED --add-opens java.desktop/java.awt.geom=ALL-UNNAMED --add-opens java.desktop/java.awt.im=ALL-UNNAMED --add-opens java.desktop/java.awt.image=ALL-UNNAMED --add-opens java.desktop/java.awt.image.renderable=ALL-UNNAMED --add-opens java.desktop/java.awt.print=ALL-UNNAMED --add-opens java.desktop/sun.awt.image=ALL-UNNAMED --add-opens java.desktop/sun.awt=ALL-UNNAMED --add-opens java.desktop/sun.font=ALL-UNNAMED --add-opens java.desktop/sun.print=ALL-UNNAMED --add-opens java.naming/javax.naming=ALL-UNNAMED --enable-native-access=ALL-UNNAMED -XX:+UseZGC -XX:+UnlockExperimentalVMOptions
```

## Git & AI Maintenance Rules
1.  **Commits**: Create atomic, descriptive git commits after significant changes.
2.  **Tracking**: Only track `gt6-modpack/`, `scripts/`, `meta/`, and `docker/`. NEVER track `bin-cache/` or `builds/`.
3.  **Mod Management**: NEVER add `.jar` files directly to `gt6-modpack/mods/`. Use `packwiz` commands.
4.  **Performance First**: Any new mod MUST be evaluated for its impact on startup time and runtime FPS.
5.  **Philosophy Adherence**: Ensure all changes align with "Gregified Vanilla". Avoid high-tech/magic mods (e.g., no teleportation pipes, no magic chests).
6.  **Self-Update**: Update this `AI_CONTEXT.md` and `MODPACK_ASSESSMENT.md` whenever new mods are added, core versions change, or project structure evolves.
7.  **Mandatory Cross-Check**: Before adding/updating mods, cross-check with the following:
    - **Official GT6 Requirements Page**: `https://gregtech.overminddl1.com/downloads/gregtech_1.7.10/index.html`
    - **GregTech-6 Modpack and Server Recommendations**: `https://gregtech.mechaenetia.com/1.7.10/modpack/`
    - **Official Forum Search**: `https://forum.mechaenetia.com/search?q=[query]` (Give priority to posts by user `gregorius`).
