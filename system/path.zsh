# Custom binaries
PATH+=":$DOTDIR/bin/"

# Custom sources
if [[ "$OSTYPE" == "darwin"* ]]; then
    # Setting PATH for VSCode
    PATH+=":/usr/local/bin"

    PATH+=":$(brew --prefix vim 2>/dev/null)/bin"

    # Add libpq pg_config path for postgres (architecture-aware path)
    PATH+=":$(brew --prefix libpq 2>/dev/null)/bin"

elif [[ "$OSTYPE" == "linux-gnu"* ]]; then

fi

[[ -d "$HOME/.local/bin" ]] && PATH+=":$HOME/.local/bin"
[[ -d "$HOME/.grok/bin" ]] && PATH+=":$HOME/.grok/bin"
[[ -d "$HOME/.grok/completions/zsh" ]] && fpath=("$HOME/.grok/completions/zsh" $fpath)
