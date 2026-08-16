#!/usr/bin/env zsh

# Backup existing tmux configuration
echo "Backing up existing tmux configuration..."
today=$(get_current_datetime)
backup_dir=$DOTDIR_BACKUP/tmux/$today
mkdir -p "$backup_dir"

backup_dotfile ~/.tmux.conf "$backup_dir"

# Create symbolic links for tmux configuration
echo "Creating tmux symlinks..."
ln -sf "$DOTDIR/tmux/tmux.conf" ~/.tmux.conf

[[ $(uname) == *Darwin* ]] && ln -sf "$DOTDIR/tmux/tmux_osx.conf" ~/.tmux_osx.conf

# tpm
[[ ! -a ~/.tmux/plugins/tpm ]] && git clone --depth=1 https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# install plugins
~/.tmux/plugins/tpm/scripts/install_plugins.sh
echo "Done!"
