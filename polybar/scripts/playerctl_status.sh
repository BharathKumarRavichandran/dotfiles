#!/bin/sh

#set -e

CONFIG_PATH="~/.config/polybar/config.ini"

player=$1
play_icon=$2
pause_icon=$3
prev_icon=$4
next_icon=$5
logo_icon=$6
color="#EC407A"

if [[ $(playerctl -p $player metadata 2>&1) == "No player could handle this command" ]]; then
    echo "%{F$color}$logo_icon offline%{F-}"
    exit 0
fi

if [[ $(playerctl status -p $1 2>/dev/null) = "Playing" ]]; then
    #color=$(polybar --config=$CONFIG_PATH --dump=foreground main 2>/dev/null)
    color="#61C766"
else
    #color=$(polybar --config=$CONFIG_PATH --dump=line-color main 2>/dev/null)
    color="#FDD835"
fi

artist=$(playerctl metadata --format {{artist}} -p $1 2>/dev/null)
title=$(playerctl metadata --format {{title}} -p $1 2>/dev/null | \
    awk -v len=40 '{ if (length($0) > len) print substr($0, 1, len-3) "..."; else print; }')

player_status=$(playerctl status -p $1 2>/dev/null)
if [[ $player_status = "Playing" ]]; then
    status=$pause_icon
else    
    status=$play_icon
fi

# Change logo for spotify
if [[ $(playerctl -p $1 metadata | grep 'spotify' | wc -l) -gt 0  ]]; then
    logo_icon=
    [[ $player_status = "Playing" ]] && color="#1DB954";
fi

#string=$(echo %{F$color}$logo_icon %{T2}$artist:%{T-} $title%{F-}%{A1:playerctl previous -p $1:} $prev_icon%{A}%{A1:playerctl play-pause -p $1:} $status%{A}%{A1:playerctl next -p $1:} $next_icon%{A}%{-o})

string=$(echo %{F$color}$logo_icon $artist:%{T-} $title%{F-} \
    %{A1:playerctl previous -p $1:} $prev_icon%{A}%{A1:playerctl play-pause -p $1:} $status%{A}%{A1:playerctl next -p $1:} $next_icon%{A}%{-o})

echo $string
