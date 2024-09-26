# Getting Started for macOS
The following instructions are for macbook.

## Clone the repository
```sh
git clone --recurse-submodules https://github.com/BharathKumarRavichandran/dotfiles.git
```


## Setting up the workspace
1. Install `brew`
1. Install and set up [git](/git).
1. Install and set up [vim](/vim).
1. Install `brave-browser`.
1. Install fonts and font-utils:
   - `Source Code Pro`
   - `FiraCode`
   - `Iosevka`
   - `powerline-fonts`
   - `xorg-font-utils`.
1. Install `bat`:
   - Configure [bat](/bat).
1. Install [ag](https://github.com/ggreer/the_silver_searcher) and `fzf`:
	- Install [ag](https://github.com/ggreer/the_silver_searcher) for fast code searching.
	- Install `fzf` for fuzzy searching.
1. Install [ack](https://beyondgrep.com/install/)
1. Install `iterm2`:
	- Install the `iterm2` terminal emulator.
	- Configure [iterm2](/iterm2) based on your preferences.
1. Install `zsh` and `zsh-completions`:
	- Install the `zsh` shell.
	- Install `zsh-completions`.
	- Configure [zsh](/zsh) based on your preferences.
1. Install [tmux](/tmux/)
1. Generate an SSH key pair and add it to GitHub.
1. Install GPG.
    1. Install `pinentry-mac` and configure it.
    1. Import primary key.
    1. Create a new signing subkey and add the signing subkey to your GitHub account.
    1. Update the signing key in [git/.gitconfig](git/.gitconfig)
1. Set up development environment:
	- Install `nvm`
	- Install `docker`.
	- Install `VSCode`:
		- [Configure VSCode](/vscode/).
		- Setup theme and file icons.
		- Install extensions.
		- Setup `settings-sync`.
	- Install `IntelliJ Idea`.
	- Install `Postman`.
	- Install `Dbeaver`.