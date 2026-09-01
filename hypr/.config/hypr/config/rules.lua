hl.workspace_rule({
	workspace = "w[tv1]",
	gaps_in = 0,
	gaps_out = 0,
	no_border = true,
	no_rounding = true,
})

-- Claude usage report, opened by clicking the waybar module. Floating and
-- centred so it reads as a panel rather than reflowing the tiled layout.
-- Ghostty only honours --class when the value is a dotted app-id, and only
-- under --gtk-single-instance=false; otherwise the window inherits the class
-- of the already running instance. See the waybar package's claude-panel.sh.
hl.window_rule({
	name = "claude-panel",
	match = { class = "^(com\\.claude\\.panel)$" },

	float = true,
	size = { 620, 480 },
	center = true,
})
