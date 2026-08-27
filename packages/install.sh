#!/usr/bin/env zsh

resolve_package_manifest() {
    local group=$1
    if (( $+commands[brew] )); then
        typeset -g PACKAGE_MANAGER=Homebrew
        typeset -g PACKAGE_MANIFEST="$DOTDIR/homebrew/Brewfile.$group"
    elif (( $+commands[pacman] )); then
        typeset -g PACKAGE_MANAGER=pacman
        typeset -g PACKAGE_MANIFEST="$DOTDIR/packages/$group.pacman.lst"
    elif (( $+commands[apt-get] )); then
        typeset -g PACKAGE_MANAGER=apt
        typeset -g PACKAGE_MANIFEST="$DOTDIR/packages/$group.apt.lst"
    else
        echo "No supported package manager found (brew, pacman, or apt-get)" >&2
        return 1
    fi

    [[ -f $PACKAGE_MANIFEST ]] || {
        echo "Package manifest not found: $PACKAGE_MANIFEST" >&2
        return 1
    }
}

list_package_group() {
    local group=$1
    resolve_package_manifest "$group" || return 1

    if [[ $PACKAGE_MANAGER == Homebrew ]]; then
        sed -nE 's/^(brew|cask) "([^"]+)".*/\2/p' "$PACKAGE_MANIFEST"
    else
        sed '/^[[:space:]]*\(#\|$\)/d' "$PACKAGE_MANIFEST"
        if [[ $group == cli ]]; then
            echo antidote
        fi
    fi
}

select_package_group() {
    local group=$1 selection
    local packages

    packages=$(list_package_group "$group") || return 1
    if (( $+commands[fzf] )); then
        print -r -- "$packages" | fzf --multi --prompt="$group packages> "
        return
    fi

    print -u2 -- "Available $group packages:"
    print -u2 -r -- "$packages"
    print -u2 -n -- "Packages to install (space-separated, blank for all): "
    read -r selection </dev/tty
    [[ -n $selection ]] && print -l -- ${(z)selection} || print -r -- "$packages"
}

install_package_group() {
    local group=$1
    shift
    local package
    local -a packages requested available missing formulae casks

    requested=("$@")
    resolve_package_manifest "$group" || return 1

    if [[ $PACKAGE_MANAGER == Homebrew ]]; then
        for package in $requested; do
            if grep -qF "brew \"$package\"" "$PACKAGE_MANIFEST"; then
                formulae+=("$package")
            elif grep -qF "cask \"$package\"" "$PACKAGE_MANIFEST"; then
                casks+=("$package")
            else
                echo "Package '$package' is not in $PACKAGE_MANIFEST" >&2
                return 1
            fi
        done
        if is_dry_run; then
            if (( ${#requested} )); then
                echo "Would install with $PACKAGE_MANAGER: ${requested[*]}"
            else
                echo "Would install $group packages with $PACKAGE_MANAGER from $PACKAGE_MANIFEST"
            fi
            return 0
        fi
        if (( ${#requested} == 0 )); then
            brew bundle install --file="$PACKAGE_MANIFEST"
            return
        fi
        if (( ${#formulae} )); then
            brew install "${formulae[@]}"
        fi
        if (( ${#casks} )); then
            brew install --cask "${casks[@]}"
        fi
        return
    fi

    packages=("${(@f)$(sed '/^[[:space:]]*\(#\|$\)/d' "$PACKAGE_MANIFEST")}")
    if (( ${#requested} )); then
        for package in $requested; do
            if (( ${packages[(Ie)$package]} )); then
                available+=("$package")
            else
                echo "Package '$package' is not in $PACKAGE_MANIFEST" >&2
                return 1
            fi
        done
        packages=("${available[@]}")
        available=()
    fi

    if is_dry_run; then
        if (( ${#requested} )); then
            echo "Would install with $PACKAGE_MANAGER: ${requested[*]}"
        else
            echo "Would install $group packages with $PACKAGE_MANAGER from $PACKAGE_MANIFEST"
        fi
        return 0
    fi

    if [[ $PACKAGE_MANAGER == pacman ]]; then
        sudo pacman -S --needed "${packages[@]}"
        return
    fi

    if [[ ${DOTFILES_APT_UPDATED:-0} == 0 ]]; then
        sudo apt-get update
        export DOTFILES_APT_UPDATED=1
    fi

    for package in $packages; do
        if apt-cache show "$package" >/dev/null 2>&1; then
            available+=("$package")
        else
            missing+=("$package")
        fi
    done

    if (( ${#available} )); then
        sudo apt-get install -y "${available[@]}"
    fi
    if (( ${#missing} )); then
        echo "Unavailable apt packages: ${missing[*]}" >&2
    fi

    rehash
    mkdir -p "$HOME/.local/bin"
    if (( ! $+commands[fd] && $+commands[fdfind] )) && [[ ! -e "$HOME/.local/bin/fd" ]]; then
        ln -s "$commands[fdfind]" "$HOME/.local/bin/fd"
    fi
    if (( ! $+commands[bat] && $+commands[batcat] )) && [[ ! -e "$HOME/.local/bin/bat" ]]; then
        ln -s "$commands[batcat]" "$HOME/.local/bin/bat"
    fi
}
