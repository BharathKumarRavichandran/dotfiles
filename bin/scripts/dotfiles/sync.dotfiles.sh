#!/bin/sh

# Getting the currently executing script directory
CURR_DIR="$(cd "$(dirname "$0")" && pwd)"

# Sourcing .env file and get DF_LOCAL_REPO_PATH
. $CURR_DIR/.env


# Sync local with home

# Prompt confirmation
echo -n "Are you sure you want to sync local with home (y/n)? "
read answer
if [ "$answer" != "${answer#[Yy]}" ] ;
then

    echo "Syncing dotfiles..."

    # Sync tty_settings
    rsync -av "$HOME/tty_settings" "$DF_LOCAL_REPO_PATH/"

    # Sync scripts excluding sync script
    rsync "$HOME/bin/scripts/dotfiles/push.dotfiles.sh" "$DF_LOCAL_REPO_PATH/bin/scripts/dotfiles/push.dotfiles.sh"
    rsync "$HOME/bin/scripts/dotfiles/reverse_sync.dotfiles.sh" "$DF_LOCAL_REPO_PATH/bin/scripts/dotfiles/reverse_sync.dotfiles.sh"
    rsync "$HOME/bin/scripts/dotfiles/setup.dotfiles.sh" "$DF_LOCAL_REPO_PATH/bin/scripts/dotfiles/setup.dotfiles.sh"

    # Sync konsolerc
    rsync "$HOME/.config/konsolerc" "$DF_LOCAL_REPO_PATH/.config/konsolerc"

    # Sync yakuakerc
    rsync "$HOME/.config/yakuakerc" "$DF_LOCAL_REPO_PATH/.config/yakuakerc"

    # Sync conky
    rsync -av "$HOME/conky" "$DF_LOCAL_REPO_PATH/"

    # Sync yakuake config
    rsync -av "$HOME/yakuake" "$DF_LOCAL_REPO_PATH/"

    # Sync vscode config
    rsync "$HOME/.config/Code/User/keybindings.json" "$DF_LOCAL_REPO_PATH/vscode/keybindings.json"

    echo "Sync done"

fi