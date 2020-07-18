############################# FZF Variables ############################

export FZF_DEFAULT_COMMAND='ag --hidden --ignore .git -g ""'
export FZF_DEFAULT_OPTS="--preview 'bat --style=numbers --theme='OneHalfDark' --color=always {}' --layout=reverse --cycle --preview-window='right:70%:wrap' -x --margin=1,4 --height=75%"