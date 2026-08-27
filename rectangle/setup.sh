#!/usr/bin/env zsh

if [[ "$OSTYPE" != "darwin"* ]]; then
	echo "Rectangle is macOS only, skipping."
	return 0
fi

if is_dry_run; then
	echo "Would back up and import Rectangle preferences"
	return 0
fi

if [[ ! -d /Applications/Rectangle.app ]]; then
	echo "Rectangle is not installed. Install it first: ./install.sh rectangle" >&2
	return 1
fi

if ! command -v python3 >/dev/null; then
	echo "python3 is required to import the Rectangle configuration." >&2
	return 1
fi

echo "Backing up existing Rectangle preferences..."
backup_dir=$(dotfile_backup_dir rectangle)
mkdir -p "$backup_dir" || return 1
if ! defaults export com.knollsoft.Rectangle "$backup_dir/com.knollsoft.Rectangle.plist"; then
	echo "Could not back up Rectangle preferences, aborting." >&2
	return 1
fi

# Rectangle rewrites its preferences on quit
was_running=false
pgrep -qx Rectangle && was_running=true
osascript -e 'quit app "Rectangle"' 2>/dev/null
for _ in {1..50}; do
	pgrep -qx Rectangle || break
	sleep 0.1
done
if pgrep -qx Rectangle; then
	echo "Rectangle is still running and would overwrite the import, aborting." >&2
	return 1
fi

echo "Importing Rectangle configuration..."
defaults export com.knollsoft.Rectangle - \
	| python3 "$DOTDIR/rectangle/import-config.py" "$DOTDIR/rectangle/config.json" \
	| defaults import com.knollsoft.Rectangle -
import_status=(${pipestatus[@]})

[[ $was_running == true ]] && open -a Rectangle

if (( import_status[1] || import_status[2] || import_status[3] )); then
	echo "Failed to import Rectangle configuration. Backup: $backup_dir" >&2
	return 1
fi
