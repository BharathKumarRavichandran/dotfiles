#!/bin/sh

# Set your dotfiles backup directory if not already set
if [ -z "$DOTDIR_BACKUP" ]; then
    DOTDIR_BACKUP=~/.dotfiles-backup
fi

# Backup existing Vim configuration
echo "Backing up existing Vim configuration..."
today=$(get_current_datetime)
backup_dir=$DOTDIR_BACKUP/vim/$today
mkdir -p "$backup_dir"

# Backup and symlink Vim configuration
backup_dotfile ~/.vimrc "$backup_dir"

# Create symbolic links for Vim configuration
echo "Creating Vim symlinks..."
ln -sf ~/.dotfiles/vim/vimrc ~/.vimrc
echo "Done!"
