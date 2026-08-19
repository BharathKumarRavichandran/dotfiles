# Aliases

# General
alias die="figlet 'Goodbye!' && poweroff"
alias killprocess='fuser -k 3000/tcp'
alias fucking="sudo"
alias trx="tar xvf"
alias vi="vim"
alias dirdu="du -h . --max-depth=1"
alias mvup="find . -mindepth 1 -type f -print -exec mv {} . \;"
alias delemptydirs="find . -type d -empty -delete"
if [[ "$OSTYPE" != "darwin"* ]]; then
    alias ports="sudo netstat -tulpn | grep LISTEN"
fi

# Utility
alias mkdir="mkdir -p"
alias _="sudo"
alias rmi="rm -i"
alias cpi="cp -i"
alias mvi="mv -i"
alias lni="ln -i"
alias df="df -kh"
alias du="du -kh"
alias sa="alias | grep -i"
alias type="type -a"
alias diffu="diff --unified"

# Monitor and Display
if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    alias brightness='xrandr --output eDP-1-1 --brightness'
    alias minbrightness='sudo su -c "echo 1 >/sys/class/backlight/intel_backlight/brightness"'
    alias resetdisplay="xrandr --output eDP1 --mode 1920x1080 --scale 1"
    alias connectdisplay1="xrandr --output HDMI1 --auto --right-of eDP1"
    alias disconnectdisplay1="xrandr --output HDMI1 --off"
    alias connectdisplay2="xrandr --output HDMI2 --auto --left-of eDP1"
    alias disconnectdisplay2="xrandr --output HDMI2 --off"
    alias disconnectdisplays="xrandr --output HDMI1 --off --output HDMI2 --off\
        --output VGA1 --off --output VGA2 --off"
fi

# Multiple directory listing aliases (eza)
alias ls='eza --icons --group-directories-first'
alias la='eza -la --icons --group-directories-first' # show hidden files
alias ll='eza -l --icons --group-directories-first --git' # long listing with git status
alias lt='eza -l --sort=modified --icons --group-directories-first' # sort by date
alias lk='eza -l --sort=size --icons --group-directories-first' # sort by size
alias lr='eza -l --recurse --icons' # recursive
alias lg='eza -l --git --icons --group-directories-first' # git-aware long listing
alias tree='eza -T --icons' # tree view

# Shortcuts to vimrc and bashrc
alias vimrc='vi ~/.vimrc'
alias bashrc='vi ~/.bashrc'
alias zshrc='vi ~/.zshrc'

# Typos
alias cim="vim"
alias bim="vim"
alias pytohn="python"

# General locations
alias doc="cd $HOME/Documents"
alias down="cd $HOME/Downloads"
alias web="cd /var/www/html"
alias web2="cd /srv/http"
alias play="cd $HOME/playground"

# PHP and Laravel
alias pa="php artisan"
alias pas="php artisan serve --host=0.0.0.0"
alias pat="php artisan tinker"
alias cu="composer update"
alias ci="composer install"

# Python
alias pi="pip install"
alias pf="pip freeze"
alias pfr="pip freeze >! requirements.txt"
alias pit="pip install --editable ."
alias srcenv="source env/bin/activate"
alias srcvenv="source venv/bin/activate"
alias py="python3"
alias py3="python3"
alias pym="python3 manage.py"

# Applications
alias c="code ."

# tmux
alias t="tmux"
alias ts="tmux-sessionizer"

# Docker
alias d="docker"
alias d-c="docker-compose"

# Kubernetes
alias k="kubectl"
