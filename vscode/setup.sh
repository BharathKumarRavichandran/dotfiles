#!/usr/bin/env zsh

if [[ "$OSTYPE" == "darwin"* ]]; then
    VSCODE_USER_DIR="$HOME/Library/Application Support/Code/User"
elif [[ "$OSTYPE" == "linux-gnu"* ]]; then
    VSCODE_USER_DIR="$HOME/.config/Code/User"
else
    echo "Unsupported platform for VS Code setup: $OSTYPE" >&2
    return 1
fi

link_dotfile "$DOTDIR/vscode/settings.json" "$VSCODE_USER_DIR/settings.json" vscode
link_dotfile "$DOTDIR/vscode/keybindings.json" "$VSCODE_USER_DIR/keybindings.json" vscode

if is_dry_run; then
    echo "Would install VS Code extensions"
    return 0
fi

if ! command -v code >/dev/null; then
    echo "code CLI not found, skipping extension install" >&2
elif ! command -v jq >/dev/null; then
    echo "jq not found, skipping extension install" >&2
else
    echo "Installing VS Code extensions..."
    jq -r '.[] | "\(.publisher).\(.name)"' "$DOTDIR/vscode/extensions.json" | while read -r extension; do
        code --install-extension "$extension"
    done
fi
