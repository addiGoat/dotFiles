#!/usr/bin/env bash

# Colors
RED='\033[0;31m'
YELLOW='\033[0;33m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
NC='\033[0m'

# Universal Directory Variables
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
readonly SCRIPT_DIR

readonly CONFIG_DIR="$HOME/.config"
readonly BACKUP_DIR="$SCRIPT_DIR/dotfiles_backup"

if [ ! -d "$BACKUP_DIR" ]; then
	mkdir "$BACKUP_DIR"
fi

backup_file () {
	target_path="$1"

	cp "$target_path" "$BACKUP_DIR"
}

remove_path() {
    local target_path="$1"

    if [ -e "$target_path" ] || [ -L "$target_path" ]; then
        rm -rf -- "$target_path"
    fi
}

# Function to check and create symlinks
make_link () {
    source_path="$1"
    target_path="$2"

    if [ -L "$target_path" ]; then
        echo -e "${YELLOW}Symlink exists: ${BLUE}$target_path${NC}"
        remove_path "$target_path"
        ln -s "$source_path" "$target_path"
    elif [ -e "$target_path" ]; then
        echo -e "${YELLOW}Real file or directory exists at ${BLUE}$target_path${YELLOW}, backing up to ${BLUE}$BACKUP_DIR${NC}"
        backup_file "$target_path"
    else
        ln -s "$source_path" "$target_path"
    fi
}

# Setup source dir variables
readonly FISH_SOURCE="$SCRIPT_DIR/fish"
readonly ROFI_SOURCE="$SCRIPT_DIR/rofi"
readonly HYPR_SOURCE="$SCRIPT_DIR/hypr"

# Destination variables
readonly FISH_DEST="$CONFIG_DIR/fish"


# Create fish links
make_link "$FISH_SOURCE/config.fish" "$FISH_DEST/config.fish"
make_link "$FISH_SOURCE/conf.d/aliases.fish" "$FISH_DEST/conf.d/aliases.fish"


