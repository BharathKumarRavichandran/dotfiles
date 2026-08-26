#!/usr/bin/env zsh

if is_dry_run; then
    echo "Would install packages from $DOTDIR/homebrew/Brewfile"
    return 0
fi

if ! command -v brew >/dev/null; then
    echo "Homebrew is not installed. Install it first: https://brew.sh" >&2
    return 1
fi

echo "Installing Homebrew packages..."
brew bundle install --file="$DOTDIR/homebrew/Brewfile"
