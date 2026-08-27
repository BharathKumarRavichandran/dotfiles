#!/usr/bin/env zsh

if [[ ! -e "$HOME/.gitconfig.local" ]]; then
    echo "Git identity is not configured. Copy git/.gitconfig.local.example to ~/.gitconfig.local and edit it." >&2
fi

link_dotfile "$DOTDIR/git/.gitconfig" "$HOME/.gitconfig" git
