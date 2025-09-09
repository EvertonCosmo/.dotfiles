local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()

-- Default is true
-- config.adjust_window_size_when_changing_font_size = true

-- This is where you actually apply your config choices

-- For example, changing the color scheme:
-- config.color_scheme = "Abernathy"
-- config.colors = {
-- 	cursor_bg = "#f0f0f0",
-- }

config.colors = {
	cursor_bg = "#f0f0f0",
}
-- config.font = wezterm.font("Maple Mono NF")
config.font = wezterm.font("Comic Code Medium")
-- config.font = wezterm.font("Comic Mono")
-- config.font = wezterm.font("Comic Shanns Mono Nerd Font")

config.webgpu_power_preference = "HighPerformance"

-- config.font_rules = {
-- 	{
-- 		intensity = "Bold",
-- 		italic = true,
-- 		font = wezterm.font({ family = "Maple Mono NF NF", weight = "Bold", style = "Italic" }),
-- 	},
-- 	{
-- 		italic = true,
-- 		intensity = "Half",
-- 		font = wezterm.font({ family = "Maple Mono NF", weight = "DemiBold", style = "Italic" }),
-- 	},
-- 	{
-- 		italic = true,
-- 		intensity = "Normal",
-- 		font = wezterm.font({ family = "Maple Mono NF", style = "Italic" }),
-- 	},
-- }
-- config.color_scheme = "rose-pine"

-- MACOS

-- config.font_size = 14
-- config.line_height = 1.2

-- LINUX

-- config.color_scheme = "GruvboxDarkHard"
-- config.color_scheme = "OxoCarbonDark"
-- config.color_scheme = "Oxocarbon Dark (Gogh)"
-- config.color_scheme = 'Gruvbox Dark (Gogh)'
-- config.color_scheme = 'Gruvbox dark, hard (base16)'
config.font_size = 11
config.line_height = 1.1

-- config.window_decorations = "RESIZE"
-- config.color_scheme = "Tokyo Night"
config.enable_tab_bar = false

config.enable_kitty_graphics = true

-- config.window_background_opacity = 0.8
-- config.macos_window_background_blur = 20
config.window_padding = {
	top = 0,
	left = 0,
	right = 0,
	bottom = 0,
}
-- and finally, return the configuration to wezterm
return config
