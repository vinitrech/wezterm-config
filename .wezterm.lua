-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices.

config.font_size = 10
config.color_scheme = "tokyonight_night"

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
		hsb = { brightness = 0.15, saturation = 1.0 },
		opacity = 1, -- This is the opacity of the IMAGE itself
	},
}

-- Finally, return the configuration to wezterm:
return config
