hl.config({
	input = {
		kb_layout = "us",
		kb_variant = "intl",
		kb_model = "pc105",
		kb_options = "lv3:ralt_switch",
		follow_mouse = 2, -- 2 - Cursor focus will be detached from keyboard focus. Clicking on a window will move keyboard focus to that window.
		accel_profile = "flat",
		float_switch_override_focus = 2,
		sensitivity = 0, -- 1.0 - 1.0, 0 means no modification
		touchpad = {
			natural_scroll = true,
		},
		natural_scroll = true,
	},
	binds = {
		allow_workspace_cycles = true,
		workspace_back_and_forth = true,
		workspace_center_on = 1,
		movefocus_cycles_fullscreen = true,
		window_direction_monitor_fallback = true,
	},
})
