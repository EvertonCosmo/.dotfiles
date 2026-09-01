#!/usr/bin/env bash
# Opens the Claude usage report in a floating terminal.
#
# Waybar's tooltip carries the same content, but GTK holds a hover back by
# roughly half a second and that delay is not configurable (gtk-tooltip-timeout
# has been ignored since GTK 3.10), so a click gets it on screen at once.
#
# Pairs with the claude-panel rule in hypr/config/rules.lua, matched on the
# window class. Ghostty only honours --class when the value is a dotted app-id,
# and only under --gtk-single-instance=false: a plain `ghostty --class=x` reuses
# the running instance and the new window inherits com.mitchellh.ghostty, so the
# rule never matches and the panel opens tiled.

set -u

# --no-color=all keeps Pango markup out; sed clears anything left, which a
# terminal would otherwise print as literal tags.
report=$(claudebar --no-color=all 2>/dev/null |
  jq -r '.tooltip // empty' 2>/dev/null |
  sed 's/<[^>]*>//g')

[ -n "$report" ] || report='  claudebar returned no data.'

exec ghostty \
  --gtk-single-instance=false \
  --class=com.claude.panel \
  --title='Claude usage' \
  -e bash -c 'printf "\n%s\n\n" "$1"; read -n 1 -s -r -p "  press any key to close"' _ "$report"
