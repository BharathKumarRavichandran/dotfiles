#!/bin/sh

# Set your dotfiles backup directory if not already set
if [ -z "$DOTDIR_BACKUP" ]; then
    DOTDIR_BACKUP=~/.dotfiles-backup
fi

# Backup existing Termite configuration
echo "Backing up existing Termite configuration..."
today=$(get_current_datetime)
backup_dir=$DOTDIR_BACKUP/termite/$today
mkdir -p "$backup_dir"

# Backup and symlink Termite configuration
backup_dotfile ~/.config/termite/config "$backup_dir"

# Create symbolic links for Termite configuration
echo "Creating Termite symlinks..."
mkdir -p ~/.config/termite
ln -sf ~/.dotfiles/termite/config ~/.config/termite/config
echo "Done!"
