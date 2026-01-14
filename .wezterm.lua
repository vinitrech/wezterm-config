-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices.
config.font_size = 9
config.font = wezterm.font("Hack Nerd Font Mono")
config.color_scheme = "tokyonight_moon"

-- Visual polish
config.line_height = 1.1
config.cell_width = 0.95
config.window_padding = {
	left = 8,
	right = 8,
	top = 6,
	bottom = 6,
}

----------------------------------------------------------------------
-- Workspace keybindings (ADDED)
----------------------------------------------------------------------

local act = wezterm.action

config.keys = {
	-- Create OR switch to a workspace by name
	{
		key = "n",
		mods = "CTRL|ALT",
		action = act.PromptInputLine({
			description = "Workspace name",
			action = wezterm.action_callback(function(window, pane, line)
				if not line or line == "" then
					return
				end

				window:perform_action(
					act.SwitchToWorkspace({
						name = line,
						spawn = {
							cwd = wezterm.home_dir,
						},
					}),
					pane
				)
			end),
		}),
	},

	-- Fast navigation between workspaces (keyboard-only launcher)
	{
		key = "w",
		mods = "CTRL|ALT",
		action = act.ShowLauncherArgs({
			flags = "WORKSPACES",
		}),
	},
}

-- Finally, return the configuration to wezterm:
return config
