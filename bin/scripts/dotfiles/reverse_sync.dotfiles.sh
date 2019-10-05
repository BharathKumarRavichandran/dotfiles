#!/bin/sh

# Getting the currently executing script directory
CURR_DIR="$(cd "$(dirname "$0")" && pwd)"

# Sourcing .env file and get DF_LOCAL_REPO_PATH
. $CURR_DIR/.env

# Sync home with local

# Prompt confirmation
echo -n "Are you sure you want to reverse sync home with local (y/n)? "
read answer
if [ "$answer" != "${answer#[Yy]}" ] ;
then

    echo "Reverse-syncing dotfiles..."

    # Sync tty_settings
    rsync -av "$DF_LOCAL_REPO_PATH/tty_settings" "$HOME/"

    # Sync scripts excluding sync script
    rsync "$DF_LOCAL_REPO_PATH/bin/scripts/dotfiles/push.dotfiles.sh" "$HOME/bin/scripts/dotfiles/push.dotfiles.sh"
    rsync "$DF_LOCAL_REPO_PATH/bin/scripts/dotfiles/sync.dotfiles.sh" "$HOME/bin/scripts/dotfiles/sync.dotfiles.sh"
    rsync "$DF_LOCAL_REPO_PATH/bin/scripts/dotfiles/setup.dotfiles.sh" "$HOME/bin/scripts/dotfiles/setup.dotfiles.sh"

    # Sync konsolerc
    rsync "$DF_LOCAL_REPO_PATH/.config/konsolerc" "$HOME/.config/konsolerc"

    # Sync yakuakerc
    rsync "$DF_LOCAL_REPO_PATH/.config/yakuakerc" "$HOME/.config/yakuakerc"

    # Sync conky
    rsync -av "$DF_LOCAL_REPO_PATH/conky" "$HOME/"

    # Sync yakuake config
    rsync -av "$DF_LOCAL_REPO_PATH/yakuake" "$HOME/"

    # Sync vscode config
    rsync "$DF_LOCAL_REPO_PATH/vscode/keybindings.json" "$HOME/.config/Code/User/keybindings.json"

    echo "Reverse-sync done"
    
fi