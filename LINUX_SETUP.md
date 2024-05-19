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
   - `powerline-fonts`
   - `xorg-font-utils`.
1. Install `bat`:
   - Configure [bat](/bat).
1. Install [ag](https://github.com/ggreer/the_silver_searcher) and `fzf`:
	- Install [ag](https://github.com/ggreer/the_silver_searcher) for fast code searching.
	- Install `fzf` for fuzzy searching.
1. Install [ack](https://beyondgrep.com/install/)
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
	- Install `nvm` by running the command:
	  ```sh
	  curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.3/install.sh | bash
	  ```
	- Install `node:lts` (from nvm).
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
