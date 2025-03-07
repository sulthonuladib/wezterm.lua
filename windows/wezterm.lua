local wezterm = require("wezterm")
local action = wezterm.action

-- local theme = wezterm.plugin.require("https://github.com/neapsix/wezterm").main
local config = {}

if wezterm.config_builder then
	config = wezterm.config_builder()
end

config.enable_scroll_bar = false
config.window_padding = {
	left = 0,
	right = 0,
	top = 0,
	bottom = 0,
}

-- config.window_background_opacity = 0.95

config.max_fps = 165
config.tab_bar_at_bottom = true
-- config.use_fancy_tab_bar = false
config.use_fancy_tab_bar = true
config.hide_tab_bar_if_only_one_tab = true
-- config.enable_tab_bar = false
config.window_decorations = "RESIZE"
config.tab_max_width = 64

config.color_scheme = "Tomorrow Night"
-- config.colors = theme.colors()
-- config.window_frame = theme.window_frame({})
-- config.window_frame.font = wezterm.font({
-- 	family = "Berkeley Mono",
-- 	weight = "Bold",
-- })
-- config.window_frame.font_size = 11

config.font = wezterm.font({
	family = "Berkeley Mono",
	weight = "Regular",
})
config.warn_about_missing_glyphs = false

config.leader = {
	key = "q",
	mods = "ALT",
	timeout_milliseconds = 2000,
}

-- local sessionizer = require("sessionizer")
-- config.keys = {
-- 	{ key = "l", mods = "LEADER", action = wezterm.action_callback(sessionizer.toggle) },
-- }
config.keys = {}

for i = 1, 8 do
	-- CTRL+ALT + number to move to that position
	table.insert(config.keys, {
		key = tostring(i),
		mods = "CTRL|ALT",
		action = wezterm.action.MoveTab(i - 1),
	})
end

for i = 1, 8 do
	table.insert(config.keys, {
		key = tostring(i),
		mods = "ALT",
		action = action.ActivateTab(i - 1),
	})
end

config.default_domain = "WSL:Ubuntu-24.04"
config.default_gui_startup_args = {
	"connect",
	"WSL:Ubuntu-24.04",
}

return config
