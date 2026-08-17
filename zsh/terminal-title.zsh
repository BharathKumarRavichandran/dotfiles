if [[ "$TERM" != (dumb|linux|*bsd*|eterm*) && "$TERM_PROGRAM" != "Apple_Terminal" ]]; then
    _set_titles_with_path() {
        local host="${HOST%%.*}"
        local abbreviated_path="${PWD/#$HOME/~}"
        print -Pn "\e]1;${host}: ${abbreviated_path}\a"
        print -Pn "\e]2;${USER}@${host}: ${abbreviated_path}\a"
        [[ -n "$TMUX" ]] && print -Pn "\ek${abbreviated_path}\e\\"
    }

    _set_titles_with_command() {
        local host="${HOST%%.*}"
        local cmd="${1[(wr)^(*=*|sudo|ssh|-*)]:t}"
        print -Pn "\e]1;${host}: ${cmd}\a"
        print -Pn "\e]2;${USER}@${host}: ${cmd}\a"
        [[ -n "$TMUX" ]] && print -Pn "\ek${cmd}\e\\"
    }

    autoload -Uz add-zsh-hook
    add-zsh-hook precmd _set_titles_with_path
    add-zsh-hook preexec _set_titles_with_command
fi
