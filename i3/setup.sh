#!/bin/bash

# Set your dotfiles backup directory if not already set
if [ -z "$DOTDIR_BACKUP" ]; then
    DOTDIR_BACKUP=~/.dotfiles-backup
fi

# Backup existing i3 configuration
echo "Backing up existing i3 configuration..."
today=$(get_current_datetime)
backup_dir=$DOTDIR_BACKUP/i3/$today
mkdir -p "$backup_dir"

backup_dotfile ~/.config/i3status/config "$backup_dir"
backup_dotfile ~/.i3/config "$backup_dir"
backup_dotfile ~/.config/i3-scrot.conf "$backup_dir"

mkdir -p ~/.config/i3status
mkdir -p ~/.i3/

# Create symbolic links for i3 configuration
echo "Creating i3 symlinks..."
ln -sf ~/.dotfiles/i3/status_config ~/.config/i3status/config
ln -sf ~/.dotfiles/i3/config ~/.i3/config
ln -sf ~/.dotfiles/i3/scrot.conf ~/.config/i3-scrot.conf
echo "Done!"
