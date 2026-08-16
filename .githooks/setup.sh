#!/usr/bin/env zsh

echo "Configuring git hooks..."
chmod +x "$DOTDIR/.githooks/pre-commit"
git -C "$DOTDIR" config core.hooksPath .githooks
echo "Done!"
