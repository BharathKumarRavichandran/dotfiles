#!/bin/sh

# Create symlinks
echo "Creating i3 symlinks..."
mkdir -p ~/.config/i3status
ln -s ~/.dotfiles/i3/status_config ~/.config/i3status/config
ln -s ~/.dotfiles/i3/config ~/.i3/config
ln -s ~/.dotfiles/i3/scrot.conf ~/.config/i3-scrot.conf
echo "Done!"
