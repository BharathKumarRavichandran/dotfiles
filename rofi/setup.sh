#!/bin/sh

# Set your dotfiles backup directory if not already set
if [ -z "$DOTDIR_BACKUP" ]; then
    DOTDIR_BACKUP=~/.dotfiles-backup
fi

# Backup existing rofi configuration
echo "Backing up existing rofi configuration..."
today=$(get_current_datetime)
backup_dir=$DOTDIR_BACKUP/rofi/$today
mkdir -p "$backup_dir"

# Backup and symlink rofi configuration
backup_dotfile ~/.config/rofi/config.rasi "$backup_dir"

# Create symbolic links for rofi configuration
echo "Creating rofi symlinks..."
mkdir -p ~/.config/rofi
ln -sf ~/.dotfiles/rofi/config.rasi ~/.config/rofi/config.rasi
echo "Done!"
