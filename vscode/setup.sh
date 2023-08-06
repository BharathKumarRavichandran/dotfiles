#!/bin/sh

# Set your dotfiles backup directory if not already set
if [ -z "$DOTDIR_BACKUP" ]; then
    DOTDIR_BACKUP=~/.dotfiles-backup
fi

# Backup existing VS Code configurations
echo "Backing up existing VS Code configurations..."
today=$(get_current_datetime)
backup_dir=$DOTDIR_BACKUP/vscode/$today
mkdir -p "$backup_dir"

# Backup and symlink VS Code configurations
backup_dotfile ~/.config/Code/User/settings.json "$backup_dir"
backup_dotfile ~/.config/Code/User/keybindings.json "$backup_dir"

# Create symbolic links for VS Code configurations
echo "Creating VS Code symlinks..."
mkdir -p ~/.config/Code/User/
ln -sf ~/.dotfiles/vscode/settings.json ~/.config/Code/User/settings.json
ln -sf ~/.dotfiles/vscode/keybindings.json ~/.config/Code/User/keybindings.json
echo "Done!"
