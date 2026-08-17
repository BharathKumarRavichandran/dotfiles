export KEYTIMEOUT=1

# Home/End/Delete key sequences vary by terminal.
[[ -n "$terminfo[khome]" ]] && bindkey "$terminfo[khome]" beginning-of-line
[[ -n "$terminfo[kend]" ]] && bindkey "$terminfo[kend]" end-of-line
[[ -n "$terminfo[kdch1]" ]] && bindkey "$terminfo[kdch1]" delete-char
