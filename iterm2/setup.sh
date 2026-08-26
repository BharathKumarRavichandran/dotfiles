#!/usr/bin/env zsh

if [[ "$OSTYPE" != "darwin"* ]]; then
	echo "iTerm2 is macOS only, skipping."
	return 0
fi

if is_dry_run; then
	echo "Would back up and import iTerm2 preferences"
	link_dotfile "$DOTDIR/iterm2/teslash-osx.json" "$HOME/Library/Application Support/iTerm2/DynamicProfiles/teslash-osx.json" iterm2
	return 0
fi

if ! command -v python3 >/dev/null; then
	echo "python3 is required to import iTerm2 color schemes." >&2
	return 1
fi

echo "Backing up existing iTerm2 configuration..."
backup_dir=$(dotfile_backup_dir iterm2)
mkdir -p "$backup_dir"
defaults export com.googlecode.iterm2 "$backup_dir/com.googlecode.iterm2.plist"

dynamic_profiles="$HOME/Library/Application Support/iTerm2/DynamicProfiles"
mkdir -p "$dynamic_profiles"
link_dotfile "$DOTDIR/iterm2/teslash-osx.json" "$dynamic_profiles/teslash-osx.json" iterm2

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
