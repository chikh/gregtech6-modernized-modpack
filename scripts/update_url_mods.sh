#!/bin/bash

# Configuration
MODS_DIR="gt6-modpack/mods"
PACKWIZ_BIN="$HOME/.aur/packwiz-git/packwiz"

echo "Checking for URL-sourced mod updates (GitHub only)..."

# Find all .pw.toml files that have a GitHub release URL
for mod_file in "$MODS_DIR"/*.pw.toml; do
    # Extract the name and URL
    # Use grep and sed to get values from TOML
    name=$(grep '^name =' "$mod_file" | sed -E 's/name = "(.*)"/\1/')
    url=$(grep -A 1 '\[download\]' "$mod_file" | grep 'url =' | sed -E 's/.*url = "(.*)"/\1/')

    # Skip if not a GitHub release URL
    if [[ $url != *"github.com"*"/releases/download/"* ]]; then
        continue
    fi

    echo "--- Checking mod: $name ---"
    
    # Extract OWNER/REPO from the URL
    repo_path=$(echo "$url" | sed -E 's|https://github.com/([^/]+/[^/]+)/releases/download/.*|\1|')
    
    echo "Repository: $repo_path"

    # Fetch release data from GitHub API
    # We try /latest first
    latest_release=$(curl -s "https://api.github.com/repos/$repo_path/releases/latest")
    
    if [[ "$latest_release" == *"Not Found"* ]]; then
        # If /latest doesn't exist, try getting the raw list and finding the first jar
        latest_release=$(curl -s "https://api.github.com/repos/$repo_path/releases")
    fi

    # Extract the latest .jar download URL
    # Grep for browser_download_url that ends in .jar
    # Filter out common non-mod jars
    new_url=$(echo "$latest_release" | grep -oE 'https://github.com/[^"]+\.jar' | \
              grep -vE '(-sources|-dev|-api|-preshadow|-lib|-deobf|-deploader|-stub)' | head -n 1)

    if [[ -z "$new_url" ]]; then
        echo "Could not find a valid .jar in the latest release for $name."
        continue
    fi

    if [[ "$url" != "$new_url" ]]; then
        echo "UPDATE FOUND for $name!"
        echo "Current URL: $url"
        echo "New URL:     $new_url"
        
        # Run packwiz to update the URL
        (cd gt6-modpack && "$PACKWIZ_BIN" url add "$name" "$new_url")
        
        if [[ $? -eq 0 ]]; then
            echo "Successfully updated $name metadata."
        else
            echo "Failed to update $name."
        fi
    else
        echo "$name is already up to date."
    fi
done

# Refresh the packwiz index at the end
echo "Refreshing packwiz index..."
(cd gt6-modpack && "$PACKWIZ_BIN" refresh)

echo "Done."
