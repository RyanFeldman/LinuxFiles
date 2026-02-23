#!/bin/bash

# Define source and target directories
SOURCE_DIR="/home/ryan/dev/LinuxFiles/vscode"
TARGET_DIR="$HOME/.config/Code/User"

# Ensure target directory exists
if [ ! -d "$TARGET_DIR" ]; then
    echo "VS Code User directory not found at $TARGET_DIR"
    exit 1
fi

# Function to backup and link file
link_file() {
    local filename=$1
    local source_path="$SOURCE_DIR/$filename"
    local target_path="$TARGET_DIR/$filename"

    if [ -f "$source_path" ]; then
        if [ -f "$target_path" ] || [ -L "$target_path" ]; then
            echo "Backing up existing $filename..."
            mv "$target_path" "${target_path}.backup_$(date +%Y%m%d_%H%M%S)"
        fi
        
        echo "Linking $filename..."
        ln -s "$source_path" "$target_path"
    else
        echo "Warning: $filename not found in $SOURCE_DIR"
    fi
}

# Link settings and keybindings
link_file "settings.json"
link_file "keybindings.json"

echo "VS Code settings linked successfully!"
