export FORGIT_NO_ALIASES=1

for antidote_home in \
    "${XDG_DATA_HOME:-$HOME/.local/share}/antidote/antidote.zsh" \
    "${HOMEBREW_PREFIX}/opt/antidote/share/antidote/antidote.zsh" \
    /usr/share/zsh/site-functions/antidote.zsh \
    /usr/share/antidote/antidote.zsh
do
    [[ -f $antidote_home ]] && source $antidote_home && break
done
unset antidote_home

if (( ! $+functions[antidote] )); then
    print -u2 -- "dotfiles: antidote is unavailable; skipping Zsh plugins (run: ./install.sh antidote)"
    return 0
fi

zsh_plugins_txt=$DOTDIR/antidote/plugins.txt
zsh_plugins_zsh=${ZDOTDIR:-$HOME}/.zsh_plugins.zsh

# regenerate the static bundle only when the plugin list changes
if [[ ! -f $zsh_plugins_zsh || $zsh_plugins_txt -nt $zsh_plugins_zsh ]]; then
    antidote bundle <$zsh_plugins_txt >|$zsh_plugins_zsh
fi
source $zsh_plugins_zsh

bindkey "$terminfo[kcuu1]" history-substring-search-up
bindkey "$terminfo[kcud1]" history-substring-search-down
