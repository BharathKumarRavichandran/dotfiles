# Aliases

# General
alias die="figlet 'Goodbye!' && poweroff"
alias killprocess='fuser -k 3000/tcp'
alias trx="tar xvf"
alias fucking="sudo"
alias trx="tar xvf"
alias vi="vim"
alias dirdu="du -h . --max-depth=1"
alias ports="sudo netstat -tulpn | grep LISTEN"

# Monitor and Display
alias brightness='xrandr --output eDP-1-1 --brightness'
alias minbrightness='sudo su -c "echo 1 >/sys/class/backlight/intel_backlight/brightness"'
alias resetdisplay="xrandr --output eDP1 --mode 1920x1080 --scale 1"
alias connectdisplay1="xrandr --output HDMI1 --auto --right-of eDP1"
alias disconnectdisplay1="xrandr --output HDMI1 --off"
alias connectdisplay2="xrandr --output HDMI2 --auto --left-of eDP1"
alias disconnectdisplay2="xrandr --output HDMI2 --off"
alias disconnectdisplays="xrandr --output HDMI1 --off --output HDMI2 --off\
    --output VGA1 --off --output VGA2 --off"

# Multiple directory listing aliases
alias ls='ls --color=always' # add colors and file type extensions
alias la='ls -Alh' # show hidden files
alias lx='ls -lXBh' # sort by extension
alias lk='ls -lSrh' # sort by size
alias lc='ls -lcrh' # sort by change time
alias lu='ls -lurh' # sort by access time
alias lr='ls -lRh' # recursive ls
alias lt='ls -ltrh' # sort by date
alias lm='ls -alh |more' # pipe through 'more'
alias lw='ls -xAh' # wide listing format
alias ll='ls -Fls' # long listing format
alias labc='ls -lap' #alphabetical sort
alias lf="ls -l | egrep -v '^d'" # files only
alias ldir="ls -l | egrep '^d'" # directories only

# Shortcuts to vimrc and bashrc
alias vimrc='vi ~/.vimrc'
alias bashrc='vi ~/.bashrc'

# Loaders
alias loadbash='source ~/.bashrc'

# Typos
alias cim="vim"
alias bim="vim"
alias pytohn="python"

# General locations
alias doc="cd $HOME/Documents"
alias down="cd $HOME/Downloads"
alias web="cd /var/www/html"
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
alias py="python"
alias py3="python3"
alias pym="python3 manage.py"

# Applications
alias c="code ."
alias postman="postman </dev/null >/dev/null 2>&1 & disown"
alias robo3t="/opt/robo3t-1.3.1-linux-x86_64-7419c406/bin/robo3t </dev/null >/dev/null 2>&1 & disown"
