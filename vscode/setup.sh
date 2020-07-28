#!/bin/sh

# Create symlinks
echo "Creating vscode symlinks..."
ln -s ~/.dotfiles/vscode/settings.json ~/.config/Code/User/settings.json
ln -s ~/.dotfiles/vscode/keybindings.json ~/.config/Code/User/keybindings.json
echo "Done!"