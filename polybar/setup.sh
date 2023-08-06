#!/bin/sh

# Create symlinks
echo "Creating polybar symlinks..."
mkdir -p ~/.config/polybar
ln -s ~/.dotfiles/polybar ~/.config
echo "Done!"