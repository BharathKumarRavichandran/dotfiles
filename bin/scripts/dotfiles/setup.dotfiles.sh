#!/bin/sh

# Setup local with home
DIR_PATH="$HOME/CS/Github/dotfiles"

# Prompt confirmation
echo -n "Are you sure you want to setup dotfiles configuration (y/n)? "
read answer
if [ "$answer" != "${answer#[Yy]}" ] ;
then

    # Create required dir
    echo "Creating required directories..."
    mkdir -p "$HOME/tty_settings/"
    mkdir -p "$HOME/.config"
    mkdir -p "$HOME/yakuake"
    mkdir -p "$HOME/conky"
    mkdir -p "$HOME/.config/Code/User/"
    mkdir -p "$HOME/bin/scripts/"

    echo "Copying dotfiles..."

    # Sync scripts excluding sync script
    cp -r "$DIR_PATH/bin/scripts/" "$HOME/bin/"

    sh "$DIR_PATH/bin/scripts/dotfiles/reverse_sync.dotfiles.sh"

    echo "Setup done"
    
fi