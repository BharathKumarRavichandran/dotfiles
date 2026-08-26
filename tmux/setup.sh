#!/usr/bin/env zsh

link_dotfile "$DOTDIR/tmux/tmux.conf" "$HOME/.tmux.conf" tmux

if is_dry_run; then
    echo "Would install TPM and tmux plugins"
    return 0
fi

if [[ ! -e "$HOME/.tmux/plugins/tpm" ]]; then
    if [[ -L "$HOME/.tmux/plugins/tpm" ]]; then
        echo "TPM path is a broken symlink: $HOME/.tmux/plugins/tpm" >&2
        return 1
    fi
    mkdir -p "$HOME/.tmux/plugins"
    git clone --depth=1 https://github.com/tmux-plugins/tpm "$HOME/.tmux/plugins/tpm"
fi

"$HOME/.tmux/plugins/tpm/scripts/install_plugins.sh"
