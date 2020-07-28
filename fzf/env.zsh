############################# FZF Variables ############################

export FZF_DEFAULT_COMMAND='ag --hidden --ignore .git -g ""'
export FZF_DEFAULT_OPTS="--preview 'bat --style=numbers --color=always {}' --layout=reverse --cycle --border --preview-window='right:70%:wrap' -x --margin=1,4 --height=75%"