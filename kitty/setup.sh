#!/bin/sh

# Create symlinks
echo "Creating kitty symlinks..."
ln -s ~/.dotfiles/kitty/kitty.conf ~/.config/kitty/kitty.conf
ln -s ~/.dotfiles/kitty/colors.conf ~/.config/kitty/colors.conf
echo "Done!"