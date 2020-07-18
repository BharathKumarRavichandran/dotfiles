#!/bin/sh

echo "Connecting to ssid: $1..."
nmcli dev wifi hotspot ssid $1 password $2
echo "Connected to: $1"