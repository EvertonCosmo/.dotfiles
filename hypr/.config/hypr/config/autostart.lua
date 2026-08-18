local terminal = "ghossty"

-- NOTE:migrate to swaysync XD
local idlehandler = "swayidle -w timeout 300 'swaylock -f -c 000000' before-sleep 'swaylock -f -c 000000'"

hl.on("hyprland.start", function()
	hl.exec_cmd(terminal)
	hl.exec_cmd(
		"systemctl --user import-environment WAYLAND_DISPLAY XDG_CURRENT_DESKTOP HYPRLAND_INSTANCE_SIGNATURE XDG_SESSION_TYPE"
	)
	hl.exec_cmd(
		"dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP HYPRLAND_INSTANCE_SIGNATURE"
	)
	hl.exec_cmd("systemctl --user start hyprland-session.target")
	hl.exec_cmd("waybar & hyprpaper")
	hl.exec_cmd("nm-applet --indicator & mako")
	hl.exec_cmd(idlehandler)
	hl.exec_cmd(os.getenv("HOME") .. "/.config/hypr/scripts/monitor-event.sh")
end)

hl.on("hyprland.shutdown", function()
	os.execute("systemctl --user stop hyprland-session.target && sleep 0.1")
	-- uses a blocking exec function and sleeps a bit to give things time to close
	-- you might also want to kill troublesome/crashing non-systemd background services here:
	-- os.execute("pkill wallpaperthing; systemctl --user stop hyprland-session.target && sleep 0.1")
end)
