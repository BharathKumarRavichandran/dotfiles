#!/usr/bin/env zsh

# Backup existing Git configuration
echo "Backing up existing Git configuration..."
today=$(get_current_datetime)
backup_dir=$DOTDIR_BACKUP/git/$today
mkdir -p "$backup_dir"

backup_dotfile ~/.gitconfig "$backup_dir"

# Create symbolic links for Git configuration
echo "Creating Git symlinks..."
ln -sf "$DOTDIR/git/.gitconfig" ~/.gitconfig
echo "Done!"
