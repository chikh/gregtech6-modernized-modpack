# AI Context: GT6: Modernized

## Design Philosophy (Core Pillars)
Any AI assisting with this project MUST adhere to these principles when suggesting mods or changes:
1.  **Gregified Vanilla**: The pack should feel like "Vanilla + GT6". Suggest mods that enhance the physical, industrial feel of GT6 (like Better Storage). Avoid mods that add "magic" blocks, teleportation, or sci-fi UI elements that clash with GT6's gritty, realistic progression.
2.  **Low-End Hardware & Runtime Optimization**: Every mod added must be analyzed for its performance impact. Prioritize performance mods (like Angelica) and avoid mods known for heavy RAM usage or tick-lag. Maintain and suggest the most efficient runtime settings (Java 17-25, LWJGL 3, and pre-configured JVM flags).
3.  **Bear's Den Inspiration**: Inspired by the **Bear's Den GT6 Survival Season 3**. Aim for a realistic industry vibe prioritized for modern Java and ease of maintenance.

## Project Workspace Structure
- **`/gt6-modpack/`**: The "Source Code". Contains everything `packwiz` tracks.
    - `overrides/`: Root-level files (e.g., `icon.png`, `java9args.txt`) that `packwiz` places in the Minecraft root.
    - `mods/`: Mod metadata files (`.pw.toml`).
    - `config/`: Mod configurations.
- **`/scripts/`**: Automation tools (`build_server.sh`, `update_quests.sh`).
- **`/meta/`**: Project metadata, branding (`logo.png`), and this `AI_CONTEXT.md`.
- **`/bin-cache/`**: (Ignored) Binary downloads (Forge installer, packwiz bootstrap).
- **`/builds/`**: (Ignored) Exported artifacts for client and server.
- **`/docker/`**: Deployment configurations.

## Maintenance Procedures
- **Mandatory Reindexing**: After ANY file changes in `gt6-modpack/`, run `packwiz refresh` inside that directory.
- **Adding Mods**: Use `packwiz curseforge add [slug]` or `packwiz url add [name] [url]`.
- **Updating Quest Book**: Run `./scripts/update_quests.sh` from the project root.
- **Building Server**: Run `./scripts/build_server.sh` from the project root. Use `--update-quests` flag to sync quests before bundling.

## Recommended JVM Flags (Java 17-25)
Required for module access and optimal GC (ZGC recommended for 4GB+ RAM):
```bash
--add-opens java.base/java.io=ALL-UNNAMED --add-opens java.base/java.lang=ALL-UNNAMED --add-opens java.base/java.lang.reflect=ALL-UNNAMED --add-opens java.base/java.net=ALL-UNNAMED --add-opens java.base/java.nio=ALL-UNNAMED --add-opens java.base/java.security=ALL-UNNAMED --add-opens java.base/java.text=ALL-UNNAMED --add-opens java.base/java.util=ALL-UNNAMED --add-opens java.base/java.util.concurrent=ALL-UNNAMED --add-opens java.base/java.util.zip=ALL-UNNAMED --add-opens java.base/sun.nio.ch=ALL-UNNAMED --enable-native-access=ALL-UNNAMED -XX:+UseZGC -XX:+UnlockExperimentalVMOptions
```

## Mandatory Server Setup
1. **Build**: Run `./scripts/build_server.sh`. Artifact is placed in `builds/server/`.
2. **Launch**: The server ZIP includes `lwjgl3ify-forgePatches.jar`. Launch using this JAR as the main entry point with the `@java9args.txt` flag.

## Developer Notes
- **Git Hygiene**: Only `gt6-modpack/`, `scripts/`, `meta/`, and `docker/` should be tracked. `bin-cache/` and `builds/` must be ignored.
- **Logo/Icon**: `meta/logo.png` is for branding; `gt6-modpack/overrides/icon.png` is for the game launcher.
