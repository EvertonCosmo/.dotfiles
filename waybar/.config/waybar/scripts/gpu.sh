#!/usr/bin/env bash
# NVIDIA GPU module for waybar: utilization in the bar, details in the tooltip.
# Stays silent when the dGPU is powered down so the module hides itself.

read -r util temp mem_used mem_total draw < <(
  nvidia-smi --query-gpu=utilization.gpu,temperature.gpu,memory.used,memory.total,power.draw \
    --format=csv,noheader,nounits 2>/dev/null | tr -d ',' | head -1
)

if [ -z "$util" ]; then
  echo '{"text":"","tooltip":"GPU powered down"}'
  exit 0
fi

class="normal"
[ "$util" -ge 60 ] 2>/dev/null && class="warning"
[ "$util" -ge 85 ] 2>/dev/null && class="critical"

tooltip="NVIDIA GPU\nUsage: ${util}%\nTemp: ${temp}°C\nVRAM: ${mem_used} / ${mem_total} MiB"
[ "$draw" != "[N/A]" ] && [ -n "$draw" ] && tooltip="$tooltip\nDraw: ${draw} W"

printf '{"text":"󰢮 %s%%","tooltip":"%s","class":"%s"}\n' "$util" "$tooltip" "$class"
