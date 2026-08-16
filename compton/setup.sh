#!/usr/bin/env zsh

# Backup existing Compton configuration
echo "Backing up existing Compton configuration..."
today=$(get_current_datetime)
backup_dir=$DOTDIR_BACKUP/compton/$today
mkdir -p "$backup_dir"

# Backup and symlink Compton configuration
backup_dotfile ~/.config/compton.conf "$backup_dir"

# Create symbolic links for Compton configuration
echo "Creating Compton symlinks..."
ln -sf "$DOTFILES_DIR/compton/compton.conf" ~/.config/compton.conf
echo "Done!"
