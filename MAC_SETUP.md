# Getting Started for macOS
The following instructions are for macbook.

## Clone the repository
```sh
git clone --recurse-submodules https://github.com/BharathKumarRavichandran/dotfiles.git
```


## Setting up the workspace
1. Install `brew`.
1. Install packages: `./configure.sh homebrew` (see [homebrew/Brewfile](/homebrew/Brewfile) for what's included, and add anything missing there).
1. Set up [git](/git).
1. Set up [vim](/vim).
1. Configure [bat](/bat).
1. Configure [iterm2](/iterm2) based on your preferences.
1. Configure [zsh](/zsh) based on your preferences.
1. Set up [tmux](/tmux/).
1. Configure [Rectangle](/rectangle/) for window management.
1. Generate an SSH key pair and add it to GitHub.
1. Set up GPG:
    1. Configure `pinentry-mac`.
    1. Import primary key.
    1. Create a new signing subkey and add the signing subkey to your GitHub account.
    1. Update the signing key in [git/.gitconfig](git/.gitconfig)
1. Set up development environment:
	- Set up [VSCode](/vscode/) (symlinks settings/keybindings and installs extensions):
		- Setup theme and file icons.
		- Setup `settings-sync`.