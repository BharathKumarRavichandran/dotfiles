#!/usr/bin/env zsh

echo "Configuring zsh configurations..."

# Clone prezto repository
if [[ ! -d "${ZDOTDIR:-$HOME}/.zprezto" ]]; then
    git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"
fi

# Backup existing zsh configuration
echo "Creating zshrc backups..."
today=$(get_current_datetime)
backup_dir=$DOTDIR_BACKUP/zsh/$today
mkdir -p "$backup_dir"

# Create configuration files
echo "Creating zsh symlinks..."
setopt EXTENDED_GLOB
for rcfile in "$DOTDIR"/zsh/^("README.md"|"setup.sh"); do
	backup_dotfile "${ZDOTDIR:-$HOME}/.${rcfile:t}" "$backup_dir"
	ln -sf "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
	echo $rcfile
done

# Set Zsh as the default shell
echo "Configuring zsh as the default shell..."
chsh -s /bin/zsh

echo "Done!"
