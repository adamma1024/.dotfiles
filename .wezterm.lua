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

-- Always spawn zsh as login shell (ensures full PATH/env in all tabs and panes)
config.default_prog = { "/bin/zsh", "-l" }

config.keys = {
	-- Full screen
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
				"/bin/zsh",
				"-lc",
				"~/code/web-pro/student-secondhand-market/scripts/dev-layout.sh; exec zsh",
			},
		}),
	},
	-- Quick split: Cmd+Shift+E to open Expo logs in right pane
	{
		key = "e",
		mods = "CMD|SHIFT",
		action = wezterm.action.SplitHorizontal({
			args = {
				"/bin/zsh",
				"-lc",
				"cd ~/code/web-pro/student-secondhand-market && npm start 2>&1; exec zsh",
			},
		}),
	},
	-- Pane navigation (vim-style: h/j/k/l)
	{ key = "h", mods = "CMD|SHIFT", action = wezterm.action.ActivatePaneDirection("Left") },
	{ key = "j", mods = "CMD|SHIFT", action = wezterm.action.ActivatePaneDirection("Down") },
	{ key = "k", mods = "CMD|SHIFT", action = wezterm.action.ActivatePaneDirection("Up") },
	{ key = "l", mods = "CMD|SHIFT", action = wezterm.action.ActivatePaneDirection("Right") },
	-- Close current pane
	{ key = "x", mods = "CMD|SHIFT", action = wezterm.action.CloseCurrentPane({ confirm = false }) },
	-- Tab navigation (browser-style)
	{ key = "Tab", mods = "CTRL", action = wezterm.action.ActivateTabRelative(1) },
	{ key = "Tab", mods = "CTRL|SHIFT", action = wezterm.action.ActivateTabRelative(-1) },
	-- Rename tab
	{
		key = "r",
		mods = "CMD|SHIFT",
		action = wezterm.action.PromptInputLine({
			description = "Enter new tab name:",
			action = wezterm.action_callback(function(window, pane, line)
				if line then
					window:active_tab():set_title(line)
				end
			end),
		}),
	},
}

-- Cmd+Click opens URLs in a new browser tab
config.mouse_bindings = {
	{
		event = { Up = { streak = 1, button = "Left" } },
		mods = "CMD",
		action = wezterm.action.OpenLinkAtMouseCursor,
	},
}

-- and finally, return the configuration to wezterm
return config
