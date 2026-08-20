# Custom binaries
PATH+=":$DOTDIR/bin/"

# Custom sources
if [[ "$OSTYPE" == "darwin"* ]]; then
    # Setting PATH for VSCode
    PATH+=":/usr/local/bin"

    [[ -d "$HOMEBREW_PREFIX/opt/vim/bin" ]] && PATH+=":$HOMEBREW_PREFIX/opt/vim/bin"

    # Add libpq pg_config path for postgres
    [[ -d "$HOMEBREW_PREFIX/opt/libpq/bin" ]] && PATH+=":$HOMEBREW_PREFIX/opt/libpq/bin"

elif [[ "$OSTYPE" == "linux-gnu"* ]]; then

fi

[[ -d "$HOME/.local/bin" ]] && PATH+=":$HOME/.local/bin"
[[ -d "$HOME/.grok/bin" ]] && PATH+=":$HOME/.grok/bin"
[[ -d "$HOME/.grok/completions/zsh" ]] && fpath=("$HOME/.grok/completions/zsh" $fpath)
