# Custom binaries
PATH+=":$HOME/.dotfiles/bin/"

# Custom sources
if [[ "$OSTYPE" == "darwin"* ]]; then
    PATH+=":/Library/Java/JavaVirtualMachines/graalvm-ee-java11-22.0.0.2/Contents/Home/bin"

    # Setting PATH for VSCode
    PATH+=":/usr/local/bin"

    # Setting PATH for Python 3.9
    PATH+=":/Library/Frameworks/Python.framework/Versions/3.9/bin"
elif [[ "$OSTYPE" == "linux-gnu"* ]]; then
fi