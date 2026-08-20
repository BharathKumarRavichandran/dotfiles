#!/usr/bin/env zsh

if [[ "$OSTYPE" != "darwin"* ]]; then
	echo "iTerm2 is macOS only, skipping."
	return 0
fi

# Backup existing iTerm2 preferences
echo "Backing up existing iTerm2 configuration..."
today=$(get_current_datetime)
backup_dir=$DOTDIR_BACKUP/iterm2/$today
mkdir -p "$backup_dir"
defaults export com.googlecode.iterm2 "$backup_dir/com.googlecode.iterm2.plist"

echo "Creating iTerm2 symlinks..."
dynamic_profiles=~/Library/Application\ Support/iTerm2/DynamicProfiles
mkdir -p "$dynamic_profiles"
backup_dotfile "$dynamic_profiles/teslash-osx.json" "$backup_dir"
ln -sf "$DOTDIR/iterm2/teslash-osx.json" "$dynamic_profiles/teslash-osx.json"

# iTerm2 overwrites its preferences domain on quit
if pgrep -qx iTerm2; then
	echo "Symlink created; color schemes not imported while iTerm2 is running."
	echo "Quit iTerm2 and re-run './configure.sh iterm2' from Terminal.app to import them."
	return 0
fi

echo "Importing iTerm2 color schemes..."
merged=$(mktemp)
defaults export com.googlecode.iterm2 - \
	| python3 "$DOTDIR/iterm2/import-color-schemes.py" "$DOTDIR/iterm2/color-schemes" >"$merged" \
	&& defaults import com.googlecode.iterm2 "$merged"
merge_status=$?
rm -f "$merged"
if (( merge_status != 0 )); then
	echo "Color scheme merge failed; preferences left untouched."
	return 1
fi

echo "Done!"
