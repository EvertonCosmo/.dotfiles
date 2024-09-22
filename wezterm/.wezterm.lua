-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()



config.adjust_window_size_when_changing_font_size = false

-- This is where you actually apply your config choices

-- For example, changing the color scheme:
-- config.color_scheme = "Abernathy"
config.font = wezterm.font("Comic Code Ligatures")
config.font_size = 13 
config.color_scheme = "Tokyo Night"

config.enable_tab_bar = false

config.window_padding = {
  top = 0,
  left = 5,
  right = 0,
  bottom = 0,
}

-- and finally, return the configuration to wezterm
return config
