# Packages

`./install.sh --profile <name>` installs packages for a machine profile.
`./install.sh --group cli` and `./install.sh --group desktop` expose the underlying
package groups. The active Homebrew, apt, or pacman manifests are selected
automatically.

Dump lists
```bash
pacman -Qe | tee pacman.lst > /dev/null
pacman -Qm | tee aur.lst > /dev/null
pip list | tee python.lst > /dev/null
```
