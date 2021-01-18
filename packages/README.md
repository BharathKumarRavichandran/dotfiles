# Packages

Dump lists
```bash
pacman -Qe | tee pacman.lst > /dev/null
pacman -Qm | tee aur.lst > /dev/null
pip list | tee python.lst > /dev/null
```
