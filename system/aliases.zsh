# Aliases

# General
alias die="figlet 'Goodbye!' && poweroff"
alias killprocess='fuser -k 3000/tcp'
alias fucking="sudo"
alias trx="tar xvf"
alias vi="${EDITOR:-vim}"
(( $+commands[nvim] )) && alias vim="nvim"
alias dirdu="du -h -d 1 ."
alias mvup="find . -mindepth 2 -type f -print -exec mv -n {} . \;"
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
if (( $+commands[eza] )); then
    alias ls='eza --icons --group-directories-first'
    alias la='eza -la --icons --group-directories-first'
    alias ll='eza -l --icons --group-directories-first --git'
    alias lx='eza -l --sort=ext --icons --group-directories-first'
    alias lt='eza -l --sort=date --icons --group-directories-first'
    alias lk='eza -l --sort=size --icons --group-directories-first'
    alias lc='eza -l --changed --sort=changed --icons --group-directories-first'
    alias lu='eza -l --accessed --sort=accessed --icons --group-directories-first'
    alias lr='eza -l --recurse --icons'
    alias lg='eza -l --git --icons --group-directories-first'
    alias lm='eza -la --icons --color=always | more'
    alias lw='eza -xA --icons --group-directories-first'
    alias labc='eza -laF --sort=name --icons'
    alias lf='eza -l --only-files --icons'
    alias ldir='eza -l --only-dirs --icons'
    alias tree='eza -T --icons'
else
    alias la='ls -Alh' # show hidden files
    alias lx='ls -lXBh' # sort by extension
    alias lk='ls -lSrh' # sort by size
    alias lc='ls -lcrh' # sort by change time
    alias lu='ls -lurh' # sort by access time
    alias lr='ls -lRh' # recursive ls
    alias lt='ls -ltrh' # sort by date
    alias lm='ls -alh | more' # pipe through more
    alias lw='ls -xAh' # wide listing format
    alias ll='ls -Fls' # long listing format
    alias labc='ls -lap' # alphabetical sort
    alias lf="ls -l | grep -v '^d'" # files only
    alias ldir="ls -l | grep '^d'" # directories only
fi

# Shortcuts to vimrc and bashrc
alias vimrc='vi ~/.vimrc'
alias nvimrc='vi ~/.config/nvim/init.lua'
alias bashrc='vi ~/.bashrc'
alias zshrc='vi ~/.zshrc'

# Typos
alias cim="${EDITOR:-vim}"
alias bim="${EDITOR:-vim}"
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
