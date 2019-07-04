#!/bin/sh

# Sync home with local
DIR_PATH="$HOME/CS/Github/dotfiles"

# Prompt confirmation
echo -n "Are you sure you want to reverse sync home with local (y/n)? "
read answer
if [ "$answer" != "${answer#[Yy]}" ] ;
then

    echo "Reverse-syncing dotfiles..."

    # Sync tty_settings
    rsync -av "$DIR_PATH/tty_settings" "$HOME/"

    # Sync scripts excluding sync script
    rsync "$DIR_PATH/bin/scripts/dotfiles/push.dotfiles.sh" "$HOME/bin/scripts/dotfiles/push.dotfiles.sh"
    rsync "$DIR_PATH/bin/scripts/dotfiles/sync.dotfiles.sh" "$HOME/bin/scripts/dotfiles/sync.dotfiles.sh"
    rsync "$DIR_PATH/bin/scripts/dotfiles/setup.dotfiles.sh" "$HOME/bin/scripts/dotfiles/setup.dotfiles.sh"

    # Sync konsolerc
    rsync "$DIR_PATH/.config/konsolerc" "$HOME/.config/konsolerc"

    # Sync yakuakerc
    rsync "$DIR_PATH/.config/yakuakerc" "$HOME/.config/yakuakerc"

    # Sync conky
    rsync -av "$DIR_PATH/conky" "$HOME/"

    # Sync yakuake config
    rsync -av "$DIR_PATH/yakuake" "$HOME/"

    # Sync vscode config
    rsync "$DIR_PATH/vscode/keybindings.json" "$HOME/.config/Code/User/keybindings.json"

    echo "Reverse-sync done"
    
fi