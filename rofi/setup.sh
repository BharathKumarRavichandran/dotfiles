#!/bin/sh

# Create symlinks
echo "Creating rofi symlinks..."
mkdir -p ~/.config/rofi
ln -s ~/.dotfiles/rofi/config.rasi ~/.config/rofi/config.rasi
echo "Done!"
