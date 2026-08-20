#!/usr/bin/env zsh

echo "Configuring zsh configurations..."

# Backup existing zsh configuration
echo "Creating zshrc backups..."
today=$(get_current_datetime)
backup_dir=$DOTDIR_BACKUP/zsh/$today
mkdir -p "$backup_dir"

# Create configuration files
echo "Creating zsh symlinks..."
setopt EXTENDED_GLOB
for rcfile in "$DOTDIR"/zsh/^("README.md"|"setup.sh"); do
	backup_dotfile "${ZDOTDIR:-$HOME}/.${rcfile:t}" "$backup_dir"
	ln -sf "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
	echo $rcfile
done

# Set Zsh as the default shell
zsh_bin=${commands[zsh]:-/bin/zsh}
for candidate in /opt/homebrew/bin/zsh /usr/local/bin/zsh; do
	[[ -x $candidate ]] && zsh_bin=$candidate && break
done

if [[ "$SHELL" != "$zsh_bin" ]]; then
	echo "Configuring $zsh_bin as the default shell..."
	grep -qxF "$zsh_bin" /etc/shells || echo "$zsh_bin" | sudo tee -a /etc/shells >/dev/null
	chsh -s "$zsh_bin"
fi

echo "Done!"
