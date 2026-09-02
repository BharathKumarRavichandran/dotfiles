# dotfiles

## Setup

```sh
git clone --recurse-submodules https://github.com/BharathKumarRavichandran/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
./bootstrap.sh --dry-run cli
./bootstrap.sh cli
```

Platform setup: [macOS](MAC_SETUP.md) · [Linux](LINUX_SETUP.md)

## Profiles

| Profile | Target | Tools |
| --- | --- | --- |
| `cli` | VPS/headless | Git, Zsh, Starship, Tmux, Vim, Neovim, Yazi |
| `macos` | macOS | Git, Zsh, Starship, Tmux, Neovim, Yazi, Kitty, iTerm2, Herdr, Rectangle, VS Code |
| `linux-desktop` | Linux X11 | Git, Zsh, Starship, Tmux, Neovim, Yazi, Kitty, i3, Xserver, Picom, Polybar, Rofi, Dunst, VS Code |
| `ai-tools` | Optional AI tools | Claude Code, Codex, Grok Build, OpenCode, Herdr |

```sh
./configure.sh --profile cli
```

## Commands

```sh
./configure.sh                              # choose tools interactively
./configure.sh --list                       # list tools
./configure.sh git vim tmux zsh             # configure tools
./configure.sh --profile macos              # choose from a profile
./configure.sh --profile macos --all        # configure the complete profile
./configure.sh --dry-run --profile macos --all # preview the complete profile
./configure.sh --all                        # configure all discovered tools
dotfiles-doctor                             # check the setup
dotfiles-update                             # update shell/editor plugins
extract archive.zip [destination]           # extract an archive without changing it
serve [directory] [port]                    # serve on a free port from 8000–9000
mkcd directory                              # create a directory and enter it
trash file ...                              # move files to the system trash
port-process port                           # show the process using a port
path-lines                                  # inspect PATH entries and problems
```

Setup scripts may install packages or plugins and change application or system
settings. Existing correct links are left unchanged.

Package installation is separate from configuration and automatically uses
Homebrew, apt, or pacman:

```sh
./install.sh --profile cli
./install.sh --profile macos
./install.sh --profile linux-desktop
./install.sh --profile ai-tools
```

Add `--all` after a profile to skip its picker.

To open only one lower-level package group instead of a complete machine profile:

```sh
./install.sh --group cli
./install.sh --group desktop
./install.sh --group ai-tools
./install.sh --group optional # Homebrew-only, opt-in tools
```

Profiles and groups open multi-select package pickers. Package names can also be
provided directly; their group is inferred from the manifests for the current
package manager:

```sh
./install.sh git zsh neovim fzf
./install.sh kitty
./install.sh lfk
```

Use `./bootstrap.sh <profile>` to install the matching packages and configure the
profile in one command.

## Backups

Existing files are moved to:

```text
~/.dotfiles-backup/<tool>/<timestamp>/
```

To use a different backup directory:

```sh
DOTDIR_BACKUP=/path/to/backups ./configure.sh git
```

List backups with `find ~/.dotfiles-backup -type f -o -type l`. To restore one,
move the current destination aside and copy or move the matching file from its
timestamped directory back under `$HOME`. Backups are never deleted automatically.

## Local configuration

Git identity and signing details live in `~/.gitconfig.local`. Copy
`git/.gitconfig.local.example` there and fill in your details. This keeps machine
or account-specific identity out of the portable Git configuration.

## Development

```sh
./configure.sh .githooks    # enable the pre-commit hook
zsh tests/setup-smoke.sh    # test backup and linking behavior
zsh tests/repo-validation.sh # validate profiles and package manifests
```

## Adding a tool

1. Add `<tool>/setup.sh` and its configuration files. Use `link_dotfile` from the
   setup script for files that belong under `$HOME`.
2. Add the tool to the appropriate profile in `configure.sh`.
3. Add its package name to the matching CLI or desktop manifests under
   `homebrew/` and `packages/`.
4. Run `./configure.sh --dry-run <tool>` and `zsh tests/repo-validation.sh`.
