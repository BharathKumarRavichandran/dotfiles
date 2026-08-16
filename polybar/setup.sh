#!/usr/bin/env zsh

# Backup existing polybar configuration
echo "Backing up existing polybar configuration..."
if [[ -e ~/.config/polybar && ! -L ~/.config/polybar ]]; then
    today=$(get_current_datetime)
    backup_dir=$DOTDIR_BACKUP/polybar/$today
    mkdir -p "$backup_dir"
    mv ~/.config/polybar "$backup_dir/"
fi

# Create symbolic link for polybar configuration
echo "Creating polybar symlink..."
ln -sfn "$DOTDIR/polybar" ~/.config/polybar
echo "Done!"
