#!/usr/bin/env zsh

# Backup existing VS Code configurations
echo "Backing up existing VS Code configurations..."
today=$(get_current_datetime)
backup_dir=$DOTDIR_BACKUP/vscode/$today
mkdir -p "$backup_dir"

# Determine the correct VS Code User directory for this OS
if [[ "$OSTYPE" == "darwin"* ]]; then
    VSCODE_USER_DIR="$HOME/Library/Application Support/Code/User"
elif [[ "$OSTYPE" == "linux-gnu"* ]]; then
    VSCODE_USER_DIR="$HOME/.config/Code/User"
fi

# Backup and symlink VS Code configurations
backup_dotfile "$VSCODE_USER_DIR/settings.json" "$backup_dir"
backup_dotfile "$VSCODE_USER_DIR/keybindings.json" "$backup_dir"

# Create symbolic links for VS Code configurations
echo "Creating VS Code symlinks..."
mkdir -p "$VSCODE_USER_DIR"
ln -sf "$DOTFILES_DIR/vscode/settings.json" "$VSCODE_USER_DIR/settings.json"
ln -sf "$DOTFILES_DIR/vscode/keybindings.json" "$VSCODE_USER_DIR/keybindings.json"
echo "Done!"