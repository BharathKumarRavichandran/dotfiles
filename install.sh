#!/usr/bin/env zsh

set -e

export DOTDIR="${0:A:h}"
export DOTFILES_DRY_RUN=0
program=${0:t}

source "$DOTDIR/system/functions.zsh"
source "$DOTDIR/packages/install.sh"

usage() {
    echo "Usage: $program [--dry-run] --profile <cli|macos|linux-desktop|ai-tools> [--all]"
    echo "       $program [--dry-run] --group <cli|desktop|ai-tools|optional>"
    echo "       $program [--dry-run] <package>..."
}

install_cli() {
    local install_antidote=0
    local -a requested

    resolve_package_manifest cli || return 1

    if (( $# == 0 )); then
        install_package_group cli
        [[ $PACKAGE_MANAGER == Homebrew ]] || source "$DOTDIR/antidote/setup.sh"
        return
    fi

    requested=("$@")
    if [[ $PACKAGE_MANAGER != Homebrew ]]; then
        (( ${requested[(Ie)antidote]} )) && install_antidote=1
        requested=( ${requested:#antidote} )
    fi

    if (( ${#requested} )); then
        install_package_group cli "${requested[@]}"
    fi
    if (( install_antidote )); then
        source "$DOTDIR/antidote/setup.sh"
    fi
}

install_picker() {
    local group=$1
    local -a selected

    selected=("${(@f)$(select_package_group "$group")}")
    (( ${#selected} )) || return 0

    if [[ $group == cli ]]; then
        install_cli "${selected[@]}"
    else
        install_package_group "$group" "${selected[@]}"
    fi
}

install_requested() {
    local package in_cli in_desktop in_optional
    local -a cli_packages desktop_packages optional_packages
    local -a cli_requested desktop_requested optional_requested

    cli_packages=("${(@f)$(list_package_group cli)}")
    desktop_packages=("${(@f)$(list_package_group desktop)}")
    if resolve_package_manifest optional >/dev/null 2>&1; then
        optional_packages=("${(@f)$(list_package_group optional)}")
    fi

    for package in "$@"; do
        in_cli=${cli_packages[(Ie)$package]}
        in_desktop=${desktop_packages[(Ie)$package]}
        in_optional=${optional_packages[(Ie)$package]}
        if (( (in_cli && in_desktop) || (in_cli && in_optional) || (in_desktop && in_optional) )); then
            echo "Package '$package' exists in multiple groups; use a group picker." >&2
            return 1
        elif (( in_cli )); then
            cli_requested+=("$package")
        elif (( in_desktop )); then
            desktop_requested+=("$package")
        elif (( in_optional )); then
            optional_requested+=("$package")
        else
            echo "Unknown package for this platform: $package" >&2
            return 1
        fi
    done

    if (( ${#cli_requested} )); then
        install_cli "${cli_requested[@]}"
    fi
    if (( ${#desktop_requested} )); then
        install_package_group desktop "${desktop_requested[@]}"
    fi
    if (( ${#optional_requested} )); then
        install_package_group optional "${optional_requested[@]}"
    fi
}

if [[ ${1:-} == --dry-run ]]; then
    export DOTFILES_DRY_RUN=1
    shift
fi

(( $# )) || { usage >&2; exit 1; }

if [[ $1 == --profile ]]; then
    if (( $# != 2 )) && ! { (( $# == 3 )) && [[ $3 == --all ]]; }; then
        usage >&2
        exit 1
    fi
    profile=$2
    install_all=${3:-}

    case $profile in
        cli)
            groups=(cli)
            ;;
        macos)
            [[ $OSTYPE == darwin* ]] || { echo "The macos profile requires macOS." >&2; exit 1; }
            groups=(cli desktop)
            ;;
        linux-desktop)
            [[ $OSTYPE == linux* ]] || { echo "The linux-desktop profile requires Linux." >&2; exit 1; }
            groups=(cli desktop)
            ;;
        ai-tools)
            groups=(ai-tools)
            ;;
        *)
            echo "Unknown profile: $profile" >&2
            exit 1
            ;;
    esac

    for group in $groups; do
        if [[ $install_all == --all ]]; then
            if [[ $group == cli ]]; then
                install_cli
            else
                install_package_group "$group"
            fi
        else
            install_picker "$group"
        fi
    done
    exit 0
fi

if [[ $1 == --group ]]; then
    (( $# == 2 )) || { usage >&2; exit 1; }
    [[ $2 == cli || $2 == desktop || $2 == ai-tools || $2 == optional ]] || { echo "Unknown package group: $2" >&2; exit 1; }
    install_picker "$2"
    exit 0
fi

install_requested "$@"
