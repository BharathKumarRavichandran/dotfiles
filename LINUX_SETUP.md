# Getting Started for Linux
The following instructions are slightly arch linux specific, but you can still reuse almost all of these.


## Clone the repository
```sh
git clone --recurse-submodules https://github.com/BharathKumarRavichandran/dotfiles.git
```


## Setting up the workspace
1. Install and set up [git](/git).
1. Install and set up [vim](/vim).
1. Install `brave-browser`.
1. Install the TLDR client for simplified command-line help - `tldr`.
1. Install `playerctl` and `volumeicon`.
1. Install `pulseaudio`, `pulseaudio-bluetooth`, and `pavucontrol`.
1. Install bluetooth modules:
   - Install `blueman`.
1. Install fonts and font-utils:
   - `Source Code Pro`
   - `FiraCode`
   - `Iosevka`
   - `Iosevka Nerd`
   - `powerline-fonts`
   - `xorg-font-utils`.
1. Install `bat`:
   - Configure [bat](/bat).
1. Install [eza](https://github.com/eza-community/eza) for a modern `ls` replacement.
1. Install [fd](https://github.com/sharkdp/fd) for a modern `find` replacement.
1. Install [ripgrep](https://github.com/BurntSushi/ripgrep) and `fzf`:
	- Install [ripgrep](https://github.com/BurntSushi/ripgrep) for fast code searching.
	- Install `fzf` for fuzzy searching.
1. Install [zoxide](https://github.com/ajeetdsouza/zoxide) for smarter directory navigation.
1. Install [delta](https://github.com/dandavison/delta) for syntax-highlighted Git and diff output.
1. Configure [i3](/i3).
1. Setup [xserver](/xserver/)
1. Install `picom`:
	- Install the `picom` compositor.
	- Configure [picom](/picom) based on your preferences.
1. Install `termite`:
	- Install the `termite` terminal emulator.
	- Configure [termite](/termite) based on your preferences.
1. Install `zsh` and `zsh-completions`:
	- Install the `zsh` shell.
	- Install `zsh-completions`.
	- Configure [zsh](/zsh) based on your preferences.
1. Install `rofi`:
	- Install the `rofi` application launcher.
	- Configure [rofi](/rofi) based on your preferences.
1. Install `dunst`
	- Install the `dunst` notification daemon.
	- Configure [dunst](/dunst) based on your preferences.
1. Install [polybar](https://github.com/adi1090x/polybar-themes):
	- Configure and install [polybar](/polybar).
1. Install file managers:
	- `pcmanfm`
	- `ranger`
1. Install `Spotify` and `Spicetify`:
	- Install `Spotify`.
	- Set up [Spicetify](/spicetify/) for theming.
1. Install additional required packages:
	- Install other required packages from [here](/packages/).
	- Make sure to have the necessary fonts installed.
1. Set up development environment:
	- Install [mise](https://mise.jdx.dev) to manage language runtimes.
	- Install `mongo`.
	- Install [LAMP](https://www.tecmint.com/install-lamp-in-arch-linux/).
	- Install `docker`.
	- Install `VSCode`:
		- [Configure VSCode](/vscode/).
		- Setup theme and file icons.
		- Install extensions.
		- Setup `settings-sync`.
	- Install `IntelliJ Idea`.
	- Install `Postman`.
	- Install `Robo3T`.
1. Set default apps in `~/.config/mimeapps.list` (the desktop files are in `/usr/share/applications`).
