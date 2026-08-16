# Named completion.zsh so it loads after compinit (needed for 'z' completions)
if command -v zoxide >/dev/null; then
    eval "$(zoxide init zsh)"
fi