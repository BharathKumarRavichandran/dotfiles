#!/usr/bin/env zsh

echo "Configuring neovim..."

backup_dir=$DOTDIR_BACKUP/nvim/$(get_current_datetime)
mkdir -p "$backup_dir"

config_dir="$HOME/.config/nvim"
mkdir -p "$HOME/.config"
backup_dotfile "$config_dir" "$backup_dir"

if [[ -L "$config_dir" ]]; then
    rm -f "$config_dir"
elif [[ -d "$config_dir" ]]; then
    rm -rf "$config_dir"
fi

ln -s "$DOTDIR/nvim" "$config_dir"

echo "Done!"
