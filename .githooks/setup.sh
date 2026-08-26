#!/usr/bin/env zsh

echo "Configuring git hooks..."
if is_dry_run; then
    echo "Would set core.hooksPath to .githooks"
    return 0
fi
chmod +x "$DOTDIR/.githooks/pre-commit"
git -C "$DOTDIR" config core.hooksPath .githooks
