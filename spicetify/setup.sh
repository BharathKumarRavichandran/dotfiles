#!/bin/sh

# Set your dotfiles backup directory if not already set
if [ -z "$DOTDIR_BACKUP" ]; then
    DOTDIR_BACKUP=~/.dotfiles-backup
fi

# Backup existing Spicetify configuration
echo "Backing up existing Spicetify configuration..."
today=$(get_current_datetime)
backup_dir=$DOTDIR_BACKUP/spicetify/$today
mkdir -p "$backup_dir"

# Backup and symlink Spicetify configurations
backup_dotfile ~/.config/spicetify/config.ini "$backup_dir"

# Create symbolic links for Spicetify Themes and Extensions
echo "Creating Spicetify symlinks..."
mkdir -p ~/.config/spicetify
ln -sf ~/.dotfiles/spicetify/config.ini ~/.config/spicetify/config.ini
ln -sf ~/.dotfiles/spicetify/Themes ~/.config/spicetify
ln -sf ~/.dotfiles/spicetify/Extensions ~/.config/spicetify
# Uncomment the following line if needed
# ln -sf ~/.dotfiles/spicetify/CustomApps ~/.config/spicetify
echo "Done!"
