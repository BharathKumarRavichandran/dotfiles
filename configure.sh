#!/usr/bin/env zsh
#
# Symlink dotfiles into place by running each tool's setup.sh.
# Usage: ./configure.sh <tool>... (e.g. ./configure.sh git vim tmux zsh)

export DOTDIR="${0:A:h}"
export DOTDIR_BACKUP="${DOTDIR_BACKUP:-$HOME/.dotfiles-backup}"

source "$DOTDIR/system/functions.zsh"

if [[ $# -eq 0 ]]; then
    echo "Usage: $0 <tool>... (e.g. $0 git vim tmux zsh)" >&2
    exit 1
fi

failed=()
for tool in "$@"; do
    setup="$DOTDIR/$tool/setup.sh"
    if [[ ! -f "$setup" ]]; then
        echo "==> $tool: no setup.sh, skipping" >&2
        continue
    fi

    echo "==> $tool"
    if ! ( cd "$DOTDIR/$tool" && source "$setup" ); then
        echo "==> $tool: failed" >&2
        failed+=("$tool")
    fi
done

if (( ${#failed} > 0 )); then
    echo "Failed: ${failed[*]}" >&2
    exit 1
fi
