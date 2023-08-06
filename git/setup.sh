#!/bin/bash

# Set your dotfiles backup directory if not already set
if [ -z "$DOTDIR_BACKUP" ]; then
    DOTDIR_BACKUP=~/.dotfiles-backup
fi

# Backup existing Git configuration
echo "Backing up existing Git configuration..."
today=$(get_current_datetime)
backup_dir=$DOTDIR_BACKUP/git/$today
mkdir -p "$backup_dir"

backup_dotfile ~/.gitconfig "$backup_dir"

# Create symbolic links for Git configuration
echo "Creating Git symlinks..."
ln -sf ~/.dotfiles/git/.gitconfig ~/.gitconfig
echo "Done!"
