############################## Homebrew #################################

if [[ "$OSTYPE" == "darwin"* ]]; then
    if [[ -x /opt/homebrew/bin/brew ]]; then # Apple Silicon
        eval "$(/opt/homebrew/bin/brew shellenv)"
    elif [[ -x /usr/local/bin/brew ]]; then # Intel Mac
        eval "$(/usr/local/bin/brew shellenv)"
    fi
fi
