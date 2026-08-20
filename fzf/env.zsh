############################# FZF Variables ############################

export FZF_DEFAULT_COMMAND='rg --files --hidden --glob "!.git/*"'
export FZF_DEFAULT_OPTS="--layout=reverse --cycle --border --height=75% --margin=1,4"

export FZF_CTRL_T_COMMAND='fd --hidden --follow --exclude .git'
export FZF_CTRL_T_OPTS="--preview '[ -d {} ] && eza -T --level=2 --icons --color=always {} || bat --style=numbers --color=always {}' --preview-window='right:70%:wrap'"

export FZF_ALT_C_COMMAND='fd --type d --hidden --follow --exclude .git'
export FZF_ALT_C_OPTS="--preview 'eza -T --level=2 --icons --color=always {}' --preview-window='right:70%:wrap'"

export FZF_COMPLETION_PATH_OPTS="--preview '[ -d {} ] && eza -T --level=2 --icons --color=always {} || bat --style=numbers --color=always {}' --preview-window='right:70%:wrap'"
export FZF_COMPLETION_DIR_OPTS="--preview 'eza -T --level=2 --icons --color=always {}' --preview-window='right:70%:wrap'"
