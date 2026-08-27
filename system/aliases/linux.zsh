# Linux-specific aliases

[[ "$OSTYPE" == linux* ]] || return

alias die="figlet 'Goodbye!' && poweroff"
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
