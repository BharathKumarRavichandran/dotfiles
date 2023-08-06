#!/bin/sh

# Set your dotfiles backup directory if not already set
if [ -z "$DOTDIR_BACKUP" ]; then
    DOTDIR_BACKUP=~/.dotfiles-backup
fi

# Backup existing Dunst configuration
echo "Backing up existing Dunst configuration..."
today=$(get_current_datetime)
backup_dir=$DOTDIR_BACKUP/dunst/$today
mkdir -p "$backup_dir"

# Backup and symlink Dunst configuration
backup_dotfile ~/.config/dunst/dunstrc "$backup_dir"

# Create symbolic links for Dunst configuration
echo "Creating Dunst symlinks..."
mkdir -p ~/.config/dunst
ln -sf ~/.dotfiles/dunst/dunstrc ~/.config/dunst/dunstrc
echo "Done!"
