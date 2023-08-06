#!/bin/sh

# Set your dotfiles backup directory if not already set
if [ -z "$DOTDIR_BACKUP" ]; then
    DOTDIR_BACKUP=~/.dotfiles-backup
fi

# Backup existing kitty configuration
echo "Backing up existing kitty configuration..."
today=$(get_current_datetime)
backup_dir=$DOTDIR_BACKUP/kitty/$today
mkdir -p "$backup_dir"

# Backup and symlink kitty configurations
backup_dotfile ~/.config/kitty/kitty.conf "$backup_dir"
backup_dotfile ~/.config/kitty/colors.conf "$backup_dir"

# Create symbolic links for kitty configurations
echo "Creating kitty symlinks..."
mkdir -p ~/.config/kitty
ln -sf ~/.dotfiles/kitty/kitty.conf ~/.config/kitty/kitty.conf
ln -sf ~/.dotfiles/kitty/colors.conf ~/.config/kitty/colors.conf
echo "Done!"
