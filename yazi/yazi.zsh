# Start Yazi and change to its final working directory on exit.
y() {
	local cwd_file cwd exit_status
	cwd_file=$(mktemp "${TMPDIR:-/tmp}/yazi-cwd.XXXXXX") || return 1

	command yazi "$@" --cwd-file="$cwd_file"
	exit_status=$?
	cwd=$(<"$cwd_file")
	command rm -f -- "$cwd_file"

	if [[ -n $cwd && $cwd != $PWD ]]; then
		builtin cd -- "$cwd" || return 1
	fi

	return $exit_status
}
