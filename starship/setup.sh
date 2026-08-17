#!/usr/bin/env zsh

echo "Configuring starship..."

backup_dir=$DOTDIR_BACKUP/starship/$(get_current_datetime)
mkdir -p "$backup_dir"

mkdir -p "$HOME/.config"
backup_dotfile "$HOME/.config/starship.toml" "$backup_dir"
ln -sf "$DOTDIR/starship/starship.toml" "$HOME/.config/starship.toml"

echo "Done!"
