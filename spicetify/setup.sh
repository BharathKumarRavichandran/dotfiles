#!/usr/bin/env zsh

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
ln -sf "$DOTDIR/spicetify/config.ini" ~/.config/spicetify/config.ini
ln -sf "$DOTDIR/spicetify/Themes" ~/.config/spicetify
ln -sf "$DOTDIR/spicetify/Extensions" ~/.config/spicetify
# Uncomment the following line if needed
# ln -sf "$DOTDIR/spicetify/CustomApps" ~/.config/spicetify
echo "Done!"
