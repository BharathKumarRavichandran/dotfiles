# Packages

`./install.sh --profile <name>` installs packages for a machine profile. The
optional `ai-tools` profile installs Claude Code, Codex, Grok Build, OpenCode,
and Herdr without adding them to the standard CLI or desktop profiles. It is
currently available through the Homebrew manifest.
`./install.sh --group cli`, `./install.sh --group desktop`, and
`./install.sh --group ai-tools` expose the underlying package groups. The active
Homebrew, apt, or pacman manifests are selected automatically.

Dump lists
```bash
pacman -Qe | tee pacman.lst > /dev/null
pacman -Qm | tee aur.lst > /dev/null
pip list | tee python.lst > /dev/null
```
