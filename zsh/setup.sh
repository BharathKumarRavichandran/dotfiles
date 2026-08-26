#!/usr/bin/env zsh

setopt EXTENDED_GLOB
for rcfile in "$DOTDIR"/zsh/^("README.md"|"setup.sh"); do
	link_dotfile "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}" zsh
done

if is_dry_run; then
	echo "Would ensure zsh is the default shell"
	return 0
fi

zsh_bin=${commands[zsh]:-/bin/zsh}
for candidate in /opt/homebrew/bin/zsh /usr/local/bin/zsh; do
	[[ -x $candidate ]] && zsh_bin=$candidate && break
done

if [[ "$SHELL" != "$zsh_bin" ]]; then
	echo "Configuring $zsh_bin as the default shell..."
	grep -qxF "$zsh_bin" /etc/shells || echo "$zsh_bin" | sudo tee -a /etc/shells >/dev/null
	chsh -s "$zsh_bin"
fi
