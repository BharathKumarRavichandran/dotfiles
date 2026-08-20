#!/usr/bin/env python3
"""Merge .itermcolors files into iTerm2's Custom Color Presets, read on stdin."""
import pathlib
import plistlib
import sys

prefs = plistlib.loads(sys.stdin.buffer.read())
presets = prefs.setdefault("Custom Color Presets", {})

schemes = sorted(pathlib.Path(sys.argv[1]).glob("*.itermcolors"))
if not schemes:
    sys.exit(f"no .itermcolors files in {sys.argv[1]}")

for scheme in schemes:
    presets[scheme.stem] = plistlib.loads(scheme.read_bytes())

plistlib.dump(prefs, sys.stdout.buffer)
