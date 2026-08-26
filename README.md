# dotfiles

## Setup

```sh
git clone --recurse-submodules https://github.com/BharathKumarRavichandran/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
./configure.sh --dry-run --profile cli
./configure.sh --profile cli
```

Platform setup: [macOS](MAC_SETUP.md) · [Linux](LINUX_SETUP.md)

## Profiles

| Profile | Target | Tools |
| --- | --- | --- |
| `cli` | VPS/headless | Git, Zsh, Starship, Tmux, Vim, Neovim |
| `macos` | macOS | Homebrew, Git, Zsh, Starship, Tmux, Neovim, Kitty, iTerm2, Rectangle, VS Code |
| `linux-desktop` | Linux X11 | Git, Zsh, Starship, Tmux, Neovim, Kitty, i3, Xserver, Picom, Polybar, Rofi, Dunst, VS Code |

```sh
./configure.sh --profile cli kitty
```

## Commands

```sh
./configure.sh --list                       # list tools
./configure.sh git vim tmux zsh             # configure tools
./configure.sh --profile macos              # configure a profile
./configure.sh --dry-run --profile macos    # preview
./configure.sh --all                        # configure all discovered tools
```

Setup scripts may install packages or plugins and change application or system
settings. Existing correct links are left unchanged.

## Backups

Existing files are moved to:

```text
~/.dotfiles-backup/<tool>/<timestamp>/
```

To use a different backup directory:

```sh
DOTDIR_BACKUP=/path/to/backups ./configure.sh git
```

## Development

```sh
./configure.sh .githooks    # enable the pre-commit hook
zsh tests/setup-smoke.sh    # test backup and linking behavior
```
