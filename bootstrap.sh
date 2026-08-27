#!/usr/bin/env zsh

set -e

DOTDIR=${0:A:h}
dry_run=()
program=${0:t}

usage() {
    echo "Usage: $program [--dry-run] <cli|macos|linux-desktop>"
}

if [[ ${1:-} == --dry-run ]]; then
    dry_run=(--dry-run)
    shift
fi

if (( $# != 1 )); then
    usage >&2
    exit 1
fi

profile=$1
zsh "$DOTDIR/install.sh" $dry_run --profile "$profile" --all
zsh "$DOTDIR/configure.sh" $dry_run --profile "$profile" --all
