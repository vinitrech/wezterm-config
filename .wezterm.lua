-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices.

config.font_size = 9
config.color_scheme = "tokyonight_night"
config.font = wezterm.font("Hack Nerd Font Mono")

-- 2. Background Image Layering
config.background = {
	{
		source = {
			-- Use an absolute path (e.g., "/Users/name/Pictures/bg.jpg" or "C:/Users/name/bg.png")
			File = "C:\\Users\\vinit\\OneDrive\\Documentos\\vaporwave.jpeg",
		},
		-- "Cover" fills the screen, "Contain" shows the whole image
		attachment = { Parallax = 0.1 }, -- Slight movement when scrolling
		width = "100%",
		height = "100%",
		-- Dim the image so you can still read your code/text
		hsb = { brightness = 0.2, saturation = 1.0 },
		opacity = 1, -- This is the opacity of the IMAGE itself
	},
	{
		source = {
			Color = "#000000",
		},
		width = "100%",
		height = "100%",
		opacity = 0.8,
	},
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
