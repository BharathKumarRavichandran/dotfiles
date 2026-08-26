#!/usr/bin/env zsh

set -eu

test_root=$(mktemp -d)
trap 'rm -rf "$test_root"' EXIT
repo=${0:A:h:h}

export HOME="$test_root/home"
export DOTDIR="$test_root/dotfiles"
export DOTDIR_BACKUP="$test_root/backups"
export DOTFILES_RUN_TIMESTAMP=test-run
mkdir -p "$HOME" "$DOTDIR/tool/config-dir"
print -r -- new >"$DOTDIR/tool/config"
print -r -- nested >"$DOTDIR/tool/config-dir/file"

source "$repo/system/functions.zsh"

ln -s missing "$DOTDIR/tool/broken"
! link_dotfile "$DOTDIR/tool/broken" "$HOME/.invalid-source" tool 2>/dev/null
! link_dotfile "$DOTDIR/tool/config" "$DOTDIR/tool/config" tool 2>/dev/null

mkdir -p "$HOME/.config/tool"
print -r -- old >"$HOME/.config/tool/config"
link_dotfile "$DOTDIR/tool/config" "$HOME/.config/tool/config" tool
[[ -L "$HOME/.config/tool/config" ]]
[[ $(<"$DOTDIR_BACKUP/tool/test-run/.config/tool/config") == old ]]

link_dotfile "$DOTDIR/tool/config" "$HOME/.config/tool/config" tool
[[ $(find "$DOTDIR_BACKUP" -type f | wc -l | tr -d ' ') == 1 ]]

mkdir -p "$HOME/.config/directory"
print -r -- old >"$HOME/.config/directory/file"
link_dotfile "$DOTDIR/tool/config-dir" "$HOME/.config/directory" tool
[[ $(<"$DOTDIR_BACKUP/tool/test-run/.config/directory/file") == old ]]

ln -s missing "$HOME/.broken"
link_dotfile "$DOTDIR/tool/config" "$HOME/.broken" tool
[[ -L "$DOTDIR_BACKUP/tool/test-run/.broken" ]]

print -r -- untouched >"$HOME/.dry-run"
export DOTFILES_DRY_RUN=1
link_dotfile "$DOTDIR/tool/config" "$HOME/.dry-run" tool
[[ ! -L "$HOME/.dry-run" && $(<"$HOME/.dry-run") == untouched ]]

unset DOTFILES_DRY_RUN
print -r -- current >"$HOME/.collision"
mkdir -p "$DOTDIR_BACKUP/tool/test-run"
print -r -- previous >"$DOTDIR_BACKUP/tool/test-run/.collision"
! link_dotfile "$DOTDIR/tool/config" "$HOME/.collision" tool 2>/dev/null
[[ $(<"$HOME/.collision") == current ]]
[[ -z "$(find "$HOME" -name '*.dotfiles-link.*' -print -quit)" ]]

! zsh "$repo/configure.sh" --dry-run ../outside >/dev/null 2>&1

configure_home="$test_root/configure-home"
configure_backups="$test_root/configure-backups"
mkdir -p "$configure_home"
print -r -- old >"$configure_home/.gitconfig"
HOME="$configure_home" DOTDIR_BACKUP="$configure_backups" \
    zsh "$repo/configure.sh" git >/dev/null
[[ -L "$configure_home/.gitconfig" ]]
[[ "$configure_home/.gitconfig" -ef "$repo/git/.gitconfig" ]]
[[ $(find "$configure_backups/git" -type f -name .gitconfig -exec head -n 1 {} \;) == old ]]

echo "setup smoke test passed"
