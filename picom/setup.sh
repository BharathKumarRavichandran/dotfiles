#!/usr/bin/env zsh

# Backup existing Picom configuration
echo "Backing up existing Picom configuration..."
today=$(get_current_datetime)
backup_dir=$DOTDIR_BACKUP/picom/$today
mkdir -p "$backup_dir"

# Backup and symlink Picom configuration
backup_dotfile ~/.config/picom/picom.conf "$backup_dir"

# Create symbolic links for Picom configuration
echo "Creating Picom symlinks..."
mkdir -p ~/.config/picom/
ln -sf "$DOTDIR/picom/picom.conf" ~/.config/picom/picom.conf
echo "Done!"
