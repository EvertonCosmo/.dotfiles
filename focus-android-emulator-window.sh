#!/bin/bash

# Raycast script to focus the Android emulator window

# @required parameters:
# @raycast.schemaVersion 1
# @raycast.title Focus Android Emulator Window
# @raycast.mode silent

osascript -e 'tell application "System Events" to tell process "qemu-system-aarch64"  to set frontmost to true'
