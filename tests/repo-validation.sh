#!/usr/bin/env zsh

set -eu

repo=${0:A:h:h}
test_home=$(mktemp -d)
trap 'rm -rf "$test_home"' EXIT

for profile in cli macos linux-desktop; do
    HOME="$test_home" zsh "$repo/configure.sh" --dry-run --profile "$profile" --all >/dev/null 2>&1
done

HOME="$test_home" zsh "$repo/install.sh" --dry-run git >/dev/null
HOME="$test_home" zsh "$repo/install.sh" --dry-run antidote >/dev/null
HOME="$test_home" zsh "$repo/install.sh" --dry-run --profile cli --all >/dev/null
if [[ $OSTYPE == darwin* ]]; then
    HOME="$test_home" zsh "$repo/install.sh" --dry-run --profile macos --all >/dev/null
else
    HOME="$test_home" zsh "$repo/install.sh" --dry-run --profile linux-desktop --all >/dev/null
fi
if HOME="$test_home" zsh "$repo/install.sh" --dry-run unknown-package >/dev/null 2>&1; then
    echo "Unknown package was accepted" >&2
    exit 1
fi

for manifest in "$repo"/packages/*.(apt|pacman).lst; do
    if [[ -n $(sort "$manifest" | uniq -d) ]]; then
        echo "Duplicate packages in ${manifest#$repo/}" >&2
        exit 1
    fi
    if ! LC_ALL=C sort -c "$manifest" 2>/dev/null; then
        echo "Package list is not sorted: ${manifest#$repo/}" >&2
        exit 1
    fi
done

for brewfile in "$repo"/homebrew/Brewfile.*; do
    ruby -c "$brewfile" >/dev/null
done

echo "repository validation passed"
