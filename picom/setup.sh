#!/bin/sh

# Create symlinks
echo "Creating picom symlinks..."
mkdir -p ~/.config/picom/
ln -s ~/.dotfiles/picom/picom.conf ~/.config/picom/picom.conf
echo "Done!"