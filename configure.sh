#!/usr/bin/env zsh

export DOTDIR="${0:A:h}"
export DOTDIR_BACKUP="${DOTDIR_BACKUP:-$HOME/.dotfiles-backup}"
export DOTFILES_RUN_TIMESTAMP="$(date +"%Y-%m-%d_%H-%M-%S")"
export DOTFILES_DRY_RUN=0
program=${0:t}

source "$DOTDIR/system/functions.zsh"

typeset -A profiles
profiles[cli]='git zsh starship tmux vim nvim'
profiles[macos]='git zsh starship tmux nvim kitty iterm2 rectangle vscode'
profiles[linux-desktop]='git zsh starship tmux nvim kitty i3 xserver picom polybar rofi dunst vscode'

available_tools=()
for setup in "$DOTDIR"/*/setup.sh "$DOTDIR"/.githooks/setup.sh(N); do
    available_tools+=("${setup:h:t}")
done
available_tools=( ${(ou)available_tools} )

usage() {
    cat <<EOF
Usage: $program [--dry-run] <tool>...
       $program [--dry-run] --profile <cli|macos|linux-desktop> [--all]
       $program [--dry-run] --all
       $program --list
EOF
}

select_tools() {
    local selection
    local -a tools
    tools=("$@")

    if (( $+commands[fzf] )); then
        print -l -- $tools | fzf --multi --prompt='configure> '
        return
    fi

    print -u2 -- "Available tools: ${tools[*]}"
    print -u2 -n -- "Tools to configure (space-separated, blank to cancel): "
    read -r selection </dev/tty
    [[ -n $selection ]] && print -l -- ${(z)selection}
}

requested=()
profile_tools=()
profile_name=
configure_all=0

while (( $# > 0 )); do
    case $1 in
        --dry-run)
            export DOTFILES_DRY_RUN=1
            ;;
        --list)
            print -l -- $available_tools
            exit 0
            ;;
        --all)
            configure_all=1
            ;;
        --profile)
            shift
            if [[ -z ${profiles[${1:-}]:-} ]]; then
                echo "Unknown or missing profile: ${1:-<missing>}" >&2
                usage >&2
                exit 1
            fi
            [[ -z $profile_name ]] || { echo "Only one profile can be selected." >&2; exit 1; }
            profile_name=$1
            profile_tools=( ${(z)profiles[$1]} )
            ;;
        --help|-h)
            usage
            exit 0
            ;;
        --*)
            echo "Unknown option: $1" >&2
            usage >&2
            exit 1
            ;;
        *)
            requested+=("$1")
            ;;
    esac
    shift
done

if [[ -n $profile_name ]]; then
    candidates=( ${(u)profile_tools} ${(u)requested} )
    if (( configure_all )); then
        requested=( $candidates )
    else
        requested=("${(@f)$(select_tools "${candidates[@]}")}")
    fi
elif (( configure_all )); then
    requested=( $available_tools )
elif (( ${#requested} == 0 )); then
    requested=("${(@f)$(select_tools "${available_tools[@]}")}")
fi

(( ${#requested} )) || exit 0
requested=( ${(u)requested} )
failed=()
first_tool=1
for tool in $requested; do
    if (( first_tool )); then
        first_tool=0
    else
        echo
    fi

    if (( ! ${available_tools[(Ie)$tool]} )); then
        echo "==> $tool: unknown tool" >&2
        failed+=("$tool")
        continue
    fi

    setup="$DOTDIR/$tool/setup.sh"
    echo "==> $tool"
    (
        set -e
        cd "$DOTDIR/$tool"
        source "$setup"
    )
    setup_status=$?
    if (( setup_status != 0 )); then
        echo "==> $tool: failed" >&2
        failed+=("$tool")
    fi
done

if (( ${#failed} > 0 )); then
    echo "Failed: ${failed[*]}" >&2
    exit 1
fi
