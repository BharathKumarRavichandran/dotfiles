#!/usr/bin/env python3
"""Apply a Rectangle config.json export to the plist read on stdin."""
import json
import plistlib
import sys

cast = {"bool": bool, "int": int, "float": float, "string": str}

with open(sys.argv[1]) as handle:
    config = json.load(handle)
prefs = plistlib.loads(sys.stdin.buffer.read())

for key, value in config["defaults"].items():
    # an empty value means unset
    if not value:
        prefs.pop(key, None)
        continue
    (kind, raw), = value.items()
    prefs[key] = cast.get(kind, lambda value: value)(raw)

shortcuts = config["shortcuts"]
for key, value in list(prefs.items()):
    if isinstance(value, dict) and "keyCode" in value and key not in shortcuts:
        del prefs[key]
prefs.update(shortcuts)

plistlib.dump(prefs, sys.stdout.buffer)
