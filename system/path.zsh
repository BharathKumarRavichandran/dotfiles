# Custom binaries
PATH+=":$HOME/.dotfiles/bin/"

# Custom sources
if [[ "$OSTYPE" == "darwin"* ]]; then
    # Setting PATH for VSCode
    PATH+=":/usr/local/bin"

    # Set JDK path
    PATH+=":/Library/Java/JavaVirtualMachines/graalvm-jdk-17.0.8+9.1/Contents/Home/bin"

    # Setting PATH for Python 3.9
    #PATH+=":/Library/Frameworks/Python.framework/Versions/3.9/bin"

    # Setup path variables of pyenv (lazy init)
    command -v pyenv >/dev/null || PATH+=":$PYENV_ROOT/bin"
    export PYENV_ROOT="$HOME/.pyenv"
    pyenv() {
      unset -f pyenv
      eval "$(command pyenv init - zsh)"
      pyenv "$@"
    }

    # Setup path variables of rbenv (lazy init)
    rbenv() {
      unset -f rbenv
      eval "$(command rbenv init - zsh)"
      rbenv "$@"
    }

    # Add libpq pg_config path for postgres
    PATH+=":/opt/homebrew/opt/libpq/bin"

elif [[ "$OSTYPE" == "linux-gnu"* ]]; then

fi