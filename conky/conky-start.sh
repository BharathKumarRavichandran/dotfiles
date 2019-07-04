#!/bin/sh
sleep 5
conky -q -c "$HOME/conky/conkybar/.conkyrc" &
conky -q -c "$HOME/conky/conkybox1/.conkyrc" & exit
