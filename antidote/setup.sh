#!/usr/bin/env zsh

antidote_dir="${XDG_DATA_HOME:-$HOME/.local/share}/antidote"

if (( $+commands[antidote] )) || \
    [[ -f "$antidote_dir/antidote.zsh" ]] || \
    [[ -f /opt/homebrew/opt/antidote/share/antidote/antidote.zsh ]] || \
    [[ -f /usr/local/opt/antidote/share/antidote/antidote.zsh ]] || \
    [[ -f /usr/share/zsh/site-functions/antidote.zsh ]] || \
    [[ -f /usr/share/antidote/antidote.zsh ]]; then
    echo "Antidote is already installed"
    return 0
fi

if is_dry_run; then
    echo "Would install Antidote in $antidote_dir"
    return 0
fi

mkdir -p "${antidote_dir:h}"
git clone --depth=1 https://github.com/mattmc3/antidote.git "$antidote_dir"
