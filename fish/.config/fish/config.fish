if status is-interactive
    # Commands to run in interactive sessions can go here
end


# Change to MacOS binary 
if type -q eza 
	alias ll "eza -l -g --icons"
	alias lla "ll -a"
end


# Set the path to include the brew bin directory
# This is required for brew to work correctly
# Do changes to MacOS
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

set -gx TERM xterm-256color

set -g fish_term24bit 1 


#Remove this on MacOS
set -U fish_user_paths $fish_user_paths ~/.local/share/flatpak/exports/bin /var/lib/flatpak/exports/bin

set -gx LANG en_US.UTF-8

set fish_greeting ""


