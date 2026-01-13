-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices.

config.font_size = 9
config.color_scheme = "tokyonight_night"
config.font = wezterm.font("Hack Nerd Font Mono")

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
