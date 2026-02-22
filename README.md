# GT6: Modernized

A GregTech 6 modpack focused on "Gregified Vanilla" gameplay, optimized for modern Java (17-25) and high performance.

## Project Structure

- **`gt6-modpack/`**: The core source files (mods, configs, and overrides). Managed via `packwiz`.
- **`scripts/`**: Automation scripts for building the server and updating quest data.
- **`docker/`**: Deployment configurations for running a dedicated server.
- **`meta/`**: Branding assets and AI development context.
- **`builds/`**: (Ignored) Output directory for generated client and server ZIPs.
- **`bin-cache/`**: (Ignored) Cache for external binaries like Forge and Packwiz installers.

## Quick Start (Development)

1.  **Requirement**: `packwiz` must be installed.
2.  **Mod Management**: All mod changes should happen in `gt6-modpack/`.
3.  **Building Server**: Run `./scripts/build_server.sh` to generate a fresh server bundle in `builds/server/`.
4.  **Exporting Client**: Run `./scripts/export_client.sh` to generate a CurseForge-compatible ZIP in `builds/client/`.
5.  **Updates**: Run `./scripts/update_quests.sh` to sync the latest quest book from Bear's Den.
6.  **Config Sync**: Run `./scripts/update_configs.sh` to sync with official GregTech 6 default configurations.

## Branding
- **Logo**: Found in `meta/logo.png`.
- **Launcher Icon**: Managed via `gt6-modpack/overrides/icon.png`.

---
*Inspired by Bear's Den Season 3.*
