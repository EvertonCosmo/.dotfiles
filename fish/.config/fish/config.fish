if status is-interactive
    # Commands to run in interactive sessions can go here
end

if type -q exa 
	alias ll "exa -l -g --icons"
	alias lla "ll -a"
end

eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

set -gx TERM xterm-256color

set -U fish_user_paths $fish_user_paths ~/.local/share/flatpak/exports/bin /var/lib/flatpak/exports/bin


set fish_greeting ""

