#!/bin/sh

# Create symlinks
echo "Creating xserver symlinks..."
ln -s ~/.dotfiles/xserver/Xresources ~/.Xresources
ln -s ~/.dotfiles/xserver/xinitrc ~/.xinitrc
ln -s ~/.dotfiles/xserver/Xclients ~/.Xclients
echo "Done!"