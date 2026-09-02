############################# FZF Variables ############################

export FZF_DEFAULT_COMMAND='rg --files --hidden --glob "!.git/*"'
export FZF_DEFAULT_OPTS="--layout=reverse --cycle --border --height=75% --margin=1,4 --color='bg:-1,bg+:#1f2430,fg:#b3b1ad,fg+:#e6e1cf,hl:#ffb454,hl+:#ffb454,info:#59c2ff,prompt:#ffb454,pointer:#f07178,marker:#aad94c,spinner:#d2a6ff,header:#95e6cb,border:#565b66'"

export FZF_CTRL_T_COMMAND='fd --hidden --follow --exclude .git'
export FZF_CTRL_T_OPTS="--preview '[ -d {} ] && eza -T --level=2 --icons --color=always {} || bat --style=numbers --color=always {}' --preview-window='right:70%:wrap'"

export FZF_ALT_C_COMMAND='fd --type d --hidden --follow --exclude .git'
export FZF_ALT_C_OPTS="--preview 'eza -T --level=2 --icons --color=always {}' --preview-window='right:70%:wrap'"

export FZF_COMPLETION_PATH_OPTS="--preview '[ -d {} ] && eza -T --level=2 --icons --color=always {} || bat --style=numbers --color=always {}' --preview-window='right:70%:wrap'"
export FZF_COMPLETION_DIR_OPTS="--preview 'eza -T --level=2 --icons --color=always {}' --preview-window='right:70%:wrap'"
