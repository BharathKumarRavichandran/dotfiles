zsh_plugins_txt=$DOTDIR/antidote/plugins-post-compinit.txt
zsh_plugins_zsh=${ZDOTDIR:-$HOME}/.zsh_plugins_post_compinit.zsh

if [[ ! -f $zsh_plugins_zsh || $zsh_plugins_txt -nt $zsh_plugins_zsh ]]; then
    antidote bundle <$zsh_plugins_txt >|$zsh_plugins_zsh
fi
source $zsh_plugins_zsh
