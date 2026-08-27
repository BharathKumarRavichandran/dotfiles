# macOS setup

Install [Homebrew](https://brew.sh), then clone and bootstrap the repository:

```sh
git clone --recurse-submodules https://github.com/BharathKumarRavichandran/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
./bootstrap.sh --dry-run macos
./bootstrap.sh macos
```

CLI formulas and desktop applications are kept separately in
[Brewfile.cli](homebrew/Brewfile.cli) and
[Brewfile.desktop](homebrew/Brewfile.desktop).

After bootstrap:

1. Copy `git/.gitconfig.local.example` to `~/.gitconfig.local`, fill in your
   identity, then import or create the configured GPG signing key.
2. Generate an SSH key and add it to the relevant Git hosts.
3. If iTerm2 was running during setup, quit it and rerun `./configure.sh iterm2`
   from Terminal.app.
