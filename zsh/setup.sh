#!/bin/zsh

echo "Configuring zsh configurations..."

# Clone prezto repository
git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"

# Backup zsh config if it exists
echo "Creating zshrc backups..."
if [ -f ~/.zshrc ];
	then
		mv ~/.zshrc ~/.zshrc.backup
fi

# Create configuration files
echo "Creating zsh symlinks..."
setopt EXTENDED_GLOB
for rcfile in ~/.dotfiles/zsh/^("README.md"|"setup.sh"); do
	ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
	echo $rcfile
done

# Set Zsh as the default shell
echo "Configuring zsh as the default shell..."
chsh -s /bin/zsh

echo "Done!"
