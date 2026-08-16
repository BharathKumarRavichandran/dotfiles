# dotfiles

My dotfiles.

For setup instructions, see:
- Linux: [LINUX_SETUP.md](LINUX_SETUP.md)
- macOS: [MAC_SETUP.md](MAC_SETUP.md)

On macOS, install packages with:
```sh
./configure.sh homebrew
```

Once the required packages are installed, symlink a tool's configuration with:
```sh
./configure.sh <tool>... # e.g. ./configure.sh git vim tmux zsh
```

## Repo setup

Enable the pre-commit lint hook with:
```sh
./configure.sh .githooks
```
