#!/bin/sh

# Set your dotfiles backup directory if not already set
if [ -z "$DOTDIR_BACKUP" ]; then
    DOTDIR_BACKUP=~/.dotfiles-backup
fi

# Backup existing X Server configurations
echo "Backing up existing X Server configurations..."
today=$(get_current_datetime)
backup_dir=$DOTDIR_BACKUP/xserver/$today
mkdir -p "$backup_dir"

# Backup and symlink X Server configurations
backup_dotfile ~/.Xresources "$backup_dir"
backup_dotfile ~/.xinitrc "$backup_dir"
backup_dotfile ~/.Xclients "$backup_dir"

# Create symbolic links for X Server configurations
echo "Creating X Server symlinks..."
ln -sf ~/.dotfiles/xserver/Xresources ~/.Xresources
ln -sf ~/.dotfiles/xserver/xinitrc ~/.xinitrc
ln -sf ~/.dotfiles/xserver/Xclients ~/.Xclients
echo "Done!"
