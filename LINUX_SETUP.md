# Linux setup

The desktop profile targets an X11 environment using i3, Picom, Polybar, Rofi,
and Dunst. Package installation supports apt and pacman.

```sh
git clone --recurse-submodules https://github.com/BharathKumarRavichandran/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
./bootstrap.sh --dry-run linux-desktop
./bootstrap.sh linux-desktop
```

Package selections live in `packages/*.apt.lst` and `packages/*.pacman.lst`.
Packages unavailable from the configured repositories are reported and skipped;
install any required AUR or third-party packages separately.

After bootstrap, enable any machine-specific services you use, such as Docker,
Bluetooth, audio, networking, or a display manager. Copy
`git/.gitconfig.local.example` to `~/.gitconfig.local`, then configure SSH and
GPG keys.
