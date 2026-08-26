#!/usr/bin/env zsh

link_dotfile "$DOTDIR/xserver/Xresources" "$HOME/.Xresources" xserver
link_dotfile "$DOTDIR/xserver/xinitrc" "$HOME/.xinitrc" xserver
link_dotfile "$DOTDIR/xserver/Xclients" "$HOME/.Xclients" xserver
