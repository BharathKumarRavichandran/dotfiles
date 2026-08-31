#!/usr/bin/env zsh

for config in yazi.toml keymap.toml theme.toml init.lua package.toml; do
	link_dotfile "$DOTDIR/yazi/$config" "$HOME/.config/yazi/$config" yazi
done

if is_dry_run; then
	echo "Would install locked Yazi plugins and flavors"
	return 0
fi

if (( ! $+commands[ya] )); then
	echo "Cannot install Yazi packages: ya is not installed" >&2
	return 1
fi

ya pkg install
