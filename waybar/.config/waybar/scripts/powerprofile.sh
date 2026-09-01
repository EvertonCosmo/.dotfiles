#!/usr/bin/env bash
# Power profile module for waybar.
# Reads/sets the active profile through power-profiles-daemon over D-Bus,
# avoiding powerprofilesctl (broken here: python-gobject missing).

BUS_NAME="net.hadess.PowerProfiles"
OBJ_PATH="/net/hadess/PowerProfiles"

get_profile() {
  busctl get-property "$BUS_NAME" "$OBJ_PATH" "$BUS_NAME" ActiveProfile 2>/dev/null |
    sed 's/^s "//; s/"$//'
}

set_profile() {
  busctl set-property "$BUS_NAME" "$OBJ_PATH" "$BUS_NAME" ActiveProfile s "$1" 2>/dev/null
}

list_profiles() {
  busctl get-property "$BUS_NAME" "$OBJ_PATH" "$BUS_NAME" Profiles 2>/dev/null |
    grep -o '"Profile" s "[a-z-]*"' | sed 's/.*s "//; s/"//'
}

cycle() {
  local current profiles next
  current=$(get_profile)
  mapfile -t profiles < <(list_profiles)
  [ ${#profiles[@]} -eq 0 ] && exit 0
  next="${profiles[0]}"
  for i in "${!profiles[@]}"; do
    if [ "${profiles[$i]}" = "$current" ]; then
      next="${profiles[$(((i + 1) % ${#profiles[@]}))]}"
      break
    fi
  done
  set_profile "$next"
}

# Instantaneous battery draw in watts, when the sysfs node exposes it.
power_draw() {
  local uw ua uv
  if uw=$(cat /sys/class/power_supply/BAT0/power_now 2>/dev/null); then
    awk -v v="$uw" 'BEGIN { w = v / 1000000; if (w >= 0.1) printf "%.1fW", w }'
  elif ua=$(cat /sys/class/power_supply/BAT0/current_now 2>/dev/null) &&
    uv=$(cat /sys/class/power_supply/BAT0/voltage_now 2>/dev/null); then
    awk -v a="$ua" -v v="$uv" 'BEGIN { w = (a * v) / 1000000000000; if (w >= 0.1) printf "%.1fW", w }'
  fi
}

case "$1" in
  toggle | cycle)
    cycle
    ;;
  set)
    set_profile "$2"
    ;;
esac

profile=$(get_profile)
case "$profile" in
  power-saver | quiet) icon="󰌪" ;;
  balanced) icon="󰾅" ;;
  performance) icon="󰓅" ;;
  *) icon="󰐿" ;;
esac

draw=$(power_draw)
text="$icon"
[ -n "$draw" ] && text="$icon $draw"

tooltip="Power profile: ${profile:-unknown}"
[ -n "$draw" ] && tooltip="$tooltip\nDraw: $draw"
tooltip="$tooltip\nLeft click: cycle profile  |  Right click: balanced"

printf '{"text":"%s","tooltip":"%s","class":"%s","alt":"%s"}\n' \
  "$text" "$tooltip" "${profile:-unknown}" "${profile:-unknown}"
