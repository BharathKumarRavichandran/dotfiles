#!/usr/bin/env zsh

if ! command -v brew >/dev/null; then
    echo "Homebrew is not installed. Install it first: https://brew.sh" >&2
    exit 1
fi

echo "Installing Homebrew packages..."
brew bundle install --file="$DOTDIR/homebrew/Brewfile"
echo "Done!"
