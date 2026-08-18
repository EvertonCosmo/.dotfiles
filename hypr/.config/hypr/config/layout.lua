hl.config({
	general = {
		gaps_in = 3,
		gaps_out = 5,
		border_size = 3,
		col = {
			active_border = { colors = { "rgba(33ccffee)", "rgba(00ff99ee)" }, angle = 45 },
			inactive_border = "rgba(595959aa)",
		},
		allow_tearing = false,
		layout = "dwindle",
		snap = {
			enabled = true,
		},
	},
	decoration = {
		rounding = 4,
		rounding_power = 2,
		inactive_opacity = 1.0,
		shadow = {
			enabled = false,
		},
		blur = {
			enabled = true,
			size = 3,
			passes = 1,
			xray = true,
			vibrancy = 0.1696,
		},
	},
	dwindle = {
		preserve_split = true,
		special_scale_factor = 0.8,
	},
	misc = {
		force_default_wallpaper = -1,
		disable_hyprland_logo = false,
		font_family = "Annotation Mono",
		vrr = 1,
		focus_on_activate = true,
	},
	render = {
		direct_scanout = true,
	},
	cursor = {
		no_hardware_cursors = true,
	},
})
