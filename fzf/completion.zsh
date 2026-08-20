############################ FZF Completion ########################

# fzf --zsh emits key-bindings + completion; needs fzf >= 0.48
if fzf_init=$(fzf --zsh 2>/dev/null); then
    eval "$fzf_init"

    bindkey -M emacs '^I' fzf-completion
    bindkey -M viins '^I' fzf-completion
fi
unset fzf_init

_fzf_compgen_path() {
    fd --hidden --follow --exclude .git --exclude node_modules . "$1"
}

_fzf_compgen_dir() {
    fd --type d --hidden --follow --exclude .git --exclude node_modules . "$1"
}
