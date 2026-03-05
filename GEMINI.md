# GEMINI.md - GT6: Modernized Project Context

This document provides essential context and instructions for AI agents working on the **GT6: Modernized** modpack project.

## Project Overview

**GT6: Modernized** is a Minecraft 1.7.10 modpack focused on a "Gregified Vanilla" experience. It centers on GregTech 6 for realistic industrial processing while prioritizing modern performance and compatibility.

### Core Pillars
1.  **Gregified Vanilla**: Maintains a "Vanilla + GT6" feel. Prioritizes physical and realistic industrial mechanics (e.g., Better Storage). Avoids "magic" blocks or teleportation.
2.  **Runtime Optimization**: Uses modern performance mods like **Angelica** (Sodium backport) and **ArchaicFix**.
3.  **Modern Compatibility**: Optimized for modern Java versions (17-25) and LWJGL 3.

### Key Technologies
- **Minecraft**: 1.7.10 (Forge 10.13.4.1614)
- **Mod Management**: `packwiz`
- **Primary Mod**: GregTech 6 (Modernized fork)
- **Performance**: Angelica, ArchaicFix, LWJGL3ify, FastCraft
- **Automation**: Bash scripts for building and syncing

## Directory Structure

- `gt6-modpack/`: **Source Directory**. Contains all mods (via `.pw.toml` files), configurations, and overrides.
- `scripts/`: Automation scripts for development and deployment.
- `meta/`: Project metadata, branding (`logo.png`), and detailed AI context (`AI_CONTEXT.md`).
- `docker/`: Docker Compose configurations for server hosting.
- `builds/`: (Ignored) Output directory for generated server and client ZIPs.
- `bin-cache/`: (Ignored) Cache for external binaries (Forge, Packwiz).

## Building and Running

### Development Commands
- **Reindex Modpack**: `cd gt6-modpack && packwiz refresh` (Mandatory after any manual file changes in `gt6-modpack/`).
- **Update Mods**:
    - CurseForge/Modrinth: `cd gt6-modpack && packwiz update --all`
    - URL/GitHub-sourced: `bash scripts/update_url_mods.sh`
- **Update Quest Book**: `bash scripts/update_quests.sh` (Syncs from Bear's Den).
- **Update Configs**: `bash scripts/update_configs.sh` (Syncs with GT6 defaults).

### Exporting Artifacts
- **Build Server Bundle**: `bash scripts/build_server.sh`
    - `--pregen`: Excludes ArchaicFix for faster initial world generation.
    - `--java-4g`: Optimizes for 4G+ RAM using ZGC flags.
- **Export Client ZIP**: `bash scripts/export_client.sh` (Generates CurseForge-compatible ZIP).

## Development Conventions

1.  **Mod Management**: Never add `.jar` files directly to `gt6-modpack/mods/`. Use `packwiz curseforge add` or `packwiz url add`.
2.  **Philosophy Adherence**: When suggesting or adding mods, ensure they align with the "Gregified Vanilla" pillar. Avoid high-tech/magic mods that break the physical realism (e.g., no teleportation pipes, no magic chests).
3.  **Performance First**: Any new mod must be evaluated for its impact on startup time and runtime FPS.
4.  **Documentation**:
    - Update `meta/AI_CONTEXT.md` when core versions or maintenance procedures change.
    - Refer to `MODPACK_ASSESSMENT.md` for comparisons with related packs (e.g., Bear's Den S3).
5.  **Git Safety**:
    - Only track `gt6-modpack/`, `scripts/`, `meta/`, and `docker/`.
    - Ensure `bin-cache/` and `builds/` remain in `.gitignore`.

## Critical Files
- `gt6-modpack/pack.toml`: Main modpack metadata.
- `meta/AI_CONTEXT.md`: Detailed technical reference for AI agents.
- `MODPACK_ASSESSMENT.md`: Rationale for mod selection and biome choices.
