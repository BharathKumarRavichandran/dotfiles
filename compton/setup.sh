#!/bin/sh

# Set your dotfiles backup directory if not already set
if [ -z "$DOTDIR_BACKUP" ]; then
    DOTDIR_BACKUP=~/.dotfiles-backup
fi

# Backup existing Compton configuration
echo "Backing up existing Compton configuration..."
today=$(get_current_datetime)
backup_dir=$DOTDIR_BACKUP/compton/$today
mkdir -p "$backup_dir"

# Backup and symlink Compton configuration
backup_dotfile ~/.config/compton.conf "$backup_dir"

# Create symbolic links for Compton configuration
echo "Creating Compton symlinks..."
ln -sf ~/.dotfiles/compton/compton.conf ~/.config/compton.conf
echo "Done!"
