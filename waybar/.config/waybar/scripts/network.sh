#!/usr/bin/env bash
# Network module for waybar.
#
# The built-in network module picks an interface on its own, and on this host
# that lands on a Docker bridge or on the VPN's IPv6 leak-guard device, which is
# up without an IPv4 address — hence a permanent "no IP". This resolves the
# interface from the default route instead, ignoring virtual devices, and folds
# the VPN state into the same module.

is_virtual() {
  case "$1" in
    docker* | br-* | veth* | virbr* | lo) return 0 ;;
    *) return 1 ;;
  esac
}

# Interface backing the default route with the lowest metric, skipping the
# virtual ones. Docker bridges carry no default route, but guard anyway.
iface=""
while read -r dev; do
  is_virtual "$dev" && continue
  iface="$dev"
  break
done < <(ip -4 route show default | awk '{for (i = 1; i < NF; i++) if ($i == "dev") print $(i + 1)}')

if [ -z "$iface" ]; then
  echo '{"text":"󰖪","tooltip":"Disconnected","class":"disconnected"}'
  exit 0
fi

ipaddr=$(ip -o -4 addr show "$iface" 2>/dev/null | awk 'NR == 1 {print $4}')

# A VPN is up when a tunnel device carries an address.
vpn=""
for dev in $(ip -o link show 2>/dev/null | awk -F': ' '{print $2}'); do
  case "$dev" in
    proton* | tun* | wg* | tailscale*)
      if ip -o -4 addr show "$dev" 2>/dev/null | grep -q inet; then
        vpn="$dev"
        break
      fi
      ;;
  esac
done

case "$iface" in
  wl*)
    read -r ssid signal < <(
      nmcli -t -f active,ssid,signal dev wifi 2>/dev/null |
        awk -F: '$1 == "yes" { print $2, $3; exit }'
    )
    icon="󰖩"
    text="$icon ${signal:-?}%"
    tooltip="${ssid:-Wi-Fi} · ${signal:-?}%\n$iface · ${ipaddr:-no IP}"
    ;;
  *)
    icon="󰈀"
    text="$icon"
    tooltip="$iface · ${ipaddr:-no IP}"
    ;;
esac

class="connected"
if [ -n "$vpn" ]; then
  text="$text 󰦝"
  tooltip="$tooltip\nVPN: $vpn"
  class="vpn"
fi

printf '{"text":"%s","tooltip":"%s","class":"%s"}\n' "$text" "$tooltip" "$class"
