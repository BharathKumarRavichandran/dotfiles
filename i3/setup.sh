#!/usr/bin/env zsh

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
ln -sf "$DOTDIR/i3/status_config" ~/.config/i3status/config
ln -sf "$DOTDIR/i3/config" ~/.i3/config
ln -sf "$DOTDIR/i3/scrot.conf" ~/.config/i3-scrot.conf
echo "Done!"
