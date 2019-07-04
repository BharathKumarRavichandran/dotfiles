#!/bin/sh

# Sync local with home
SYNC_PATH="$HOME/CS/Github/dotfiles"

# Prompt confirmation
echo -n "Are you sure you want to sync local with home (y/n)? "
read answer
if [ "$answer" != "${answer#[Yy]}" ] ;
then

    echo "Syncing dotfiles..."

    # Sync tty_settings
    rsync -av "$HOME/tty_settings" "$SYNC_PATH/"

    # Sync scripts excluding sync script
    rsync "$HOME/bin/scripts/dotfiles/push.dotfiles.sh" "$SYNC_PATH/bin/scripts/dotfiles/push.dotfiles.sh"
    rsync "$HOME/bin/scripts/dotfiles/reverse_sync.dotfiles.sh" "$SYNC_PATH/bin/scripts/dotfiles/reverse_sync.dotfiles.sh"
    rsync "$HOME/bin/scripts/dotfiles/setup.dotfiles.sh" "$SYNC_PATH/bin/scripts/dotfiles/setup.dotfiles.sh"

    # Sync konsolerc
    rsync "$HOME/.config/konsolerc" "$SYNC_PATH/.config/konsolerc"

    # Sync yakuakerc
    rsync "$HOME/.config/yakuakerc" "$SYNC_PATH/.config/yakuakerc"

    # Sync conky
    rsync -av "$HOME/conky" "$SYNC_PATH/"

    # Sync yakuake config
    rsync -av "$HOME/yakuake" "$SYNC_PATH/"

    # Sync vscode config
    rsync "$HOME/.config/Code/User/keybindings.json" "$SYNC_PATH/vscode/keybindings.json"

    echo "Sync done"

fi