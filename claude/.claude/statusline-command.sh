#!/usr/bin/env bash
input=$(cat)
model=$(echo "$input" | jq -r '.model.display_name // empty')
cwd=$(echo "$input" | jq -r '.workspace.current_dir // empty')
used=$(echo "$input" | jq -r '.context_window.used_percentage // empty')

user=$(whoami)
host=$(hostname -s)
dir=$(basename "${cwd:-$(pwd)}")

branch=$(git -C "${cwd:-$(pwd)}" --no-optional-locks rev-parse --abbrev-ref HEAD 2>/dev/null)

left="[${user}@${host} ${dir}]"

if [ -n "$branch" ]; then
  left="${left} (${branch})"
fi

if [ -n "$model" ]; then
  left="${left} | ${model}"
fi

if [ -n "$used" ]; then
  left="${left} ctx:$(printf '%.0f' "$used")%"
fi

printf "%s" "$left"
