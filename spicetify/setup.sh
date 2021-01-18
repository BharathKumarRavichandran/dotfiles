#!/bin/sh

# Create symlinks
echo "Creating spicetify symlinks..."
mkdir -p ~/.config/spicetify
ln -s ~/.dotfiles/spicetify/config.ini ~/.config/spicetify/config.ini
ln -s ~/.dotfiles/spicetify/Themes ~/.config/spicetify/Themes
ln -s ~/.dotfiles/spicetify/Extensions ~/.config/spicetify/Extensions
ln -s ~/.dotfiles/spicetify/CustomApps ~/.config/spicetify/CustomApps
echo "Done!"
