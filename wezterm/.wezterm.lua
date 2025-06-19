-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()

-- Default is true
-- config.adjust_window_size_when_changing_font_size = false

-- This is where you actually apply your config choices

-- For example, changing the color scheme:
-- config.color_scheme = "Abernathy"
config.colors = {
	cursor_bg = "#f0f0f0",
}
-- config.font = wezterm.font("Comic Code Ligatures")
config.font = wezterm.font("Maple Mono")
config.webgpu_power_preference = "HighPerformance"
-- config.enable_kitty_graphics = true
-- config.font_size = 12.5
-- config.font_size = 12.6
config.font_size = 14
config.line_height = 1.2
-- config.font_rules = {}
-- config.harfbuzz_features = {}

config.window_decorations = "RESIZE"
-- config.color_scheme = "Tokyo Night"

config.enable_tab_bar = false

-- config.use_fancy_tab_bar = true
-- config.font_rules = {
-- 	{
-- 		intensity = "Bold",
-- 		italic = true
-- 		intensity = "Half",
-- 		italic = true,
-- 		font = wezterm.font({ family = "Maple Mono NF", weight = "DemiBold", style = "Italic" }),
-- 	},
-- 	{
-- 		intensity = "Normal",
-- 		italic = true,
-- 		font = wezterm.font({ family = "Maple Mono NF", style = "Italic" }),
-- 	},
-- }

config.window_padding = {
	top = 0,
	left = 0,
	right = 0,
	bottom = 0,
}

-- and finally, return the configuration to wezterm
return config
