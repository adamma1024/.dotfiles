-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices
config.font = wezterm.font("Hack Nerd Font Mono")
config.font_size = 20.0

-- For example, changing the color scheme:
config.color_scheme = "Dracula"

-- Show title and resize bar
config.window_decorations = "TITLE|RESIZE"
config.hide_tab_bar_if_only_one_tab = true

config.window_background_opacity = 0.6
config.macos_window_background_blur = 10
config.initial_rows = 40
config.initial_cols = 100

-- Full screen mode is same as macOS full screen
config.keys = {
	{
		key = "f",
		mods = "CMD|CTRL",
		action = wezterm.action.ToggleFullScreen,
	},
	-- Dev layout: Cmd+Shift+D
	-- Opens split pane (LazyVim left, Expo logs right) + floating Simulator
	{
		key = "d",
		mods = "CMD|SHIFT",
		action = wezterm.action.SpawnCommandInNewTab({
			args = {
				"bash",
				"-c",
				"~/code/web-pro/student-secondhand-market/scripts/dev-layout.sh && exec zsh",
			},
		}),
	},
	-- Quick split: Cmd+Shift+E to open Expo logs in right pane
	{
		key = "e",
		mods = "CMD|SHIFT",
		action = wezterm.action.SplitHorizontal({
			args = {
				"bash",
				"-c",
				"cd ~/code/web-pro/student-secondhand-market && npx expo start 2>&1; exec zsh",
			},
		}),
	},
	-- Pane navigation
	{ key = "h", mods = "CMD|SHIFT", action = wezterm.action.ActivatePaneDirection("Left") },
	{ key = "l", mods = "CMD|SHIFT", action = wezterm.action.ActivatePaneDirection("Right") },
	-- Close current pane
	{ key = "x", mods = "CMD|SHIFT", action = wezterm.action.CloseCurrentPane({ confirm = false }) },
}

-- and finally, return the configuration to wezterm
return config
