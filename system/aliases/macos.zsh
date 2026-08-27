# macOS-specific aliases

[[ "$OSTYPE" == darwin* ]] || return

alias die="figlet 'Goodbye!' && sudo shutdown -h now"
alias ports="sudo lsof -nP -iTCP -sTCP:LISTEN"
