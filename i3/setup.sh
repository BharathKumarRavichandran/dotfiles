#!/bin/sh

# Create symlinks
echo "Creating i3 symlinks..."
ln -s ~/.dotfiles/i3/status_config ~/.config/i3status/config
ln -s ~/.dotfiles/i3/config ~/.i3/config
echo "Done!"