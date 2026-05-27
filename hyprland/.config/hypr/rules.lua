hl.workspace_rule({
	workspace = "special:term",
	on_created_empty = Terminal,
})

hl.window_rule({
	name = "special-term",
	match = {
		workspace = "special:term",
		class = "kitty",
	},
	float = true,
	center = true,
	dim_around = true,
	size = { "(monitor_w*0.6)", "(monitor_h*0.6)" },
})

hl.window_rule({
	name = "browser",
	match = {
		class = "firefox",
	},
	workspace = 2,
})

hl.window_rule({
	name = "spotify_other",
	match = {
		class = "spotify",
	},
	float = true,
	size = { "(monitor_w*0.6)", "(monitor_h*0.6)" },
	move = { 80, 90 },
})

hl.window_rule({
	name = "blueman",
	match = {
		class = "blueman-manager",
	},
	float = true,
	center = true,
	size = { 600, 400 },
})

local suppressMaximizeRule = hl.window_rule({
	-- Ignore maximize requests from all apps. You'll probably like this.
	name = "suppress-maximize-events",
	match = { class = ".*" },

	suppress_event = "maximize",
})
-- suppressMaximizeRule:set_enabled(false)

hl.window_rule({
	-- Fix some dragging issues with XWayland
	name = "fix-xwayland-drags",
	match = {
		class = "^$",
		title = "^$",
		xwayland = true,
		float = true,
		fullscreen = false,
		pin = false,
	},

	no_focus = true,
})

hl.window_rule({
	name = "move-hyprland-run",
	match = { class = "hyprland-run" },

	move = "20 monitor_h-120",
	float = true,
})

-- Ref https://wiki.hypr.land/Configuring/Basics/Workspace-Rules/
-- "Smart gaps" / "No gaps when only"
-- Är det nice?
hl.workspace_rule({ workspace = "w[tv1]", gaps_out = 0, gaps_in = 0 })
hl.workspace_rule({ workspace = "f[1]", gaps_out = 0, gaps_in = 0 })
hl.window_rule({
	name = "no-gaps-wtv1",
	match = { float = false, workspace = "w[tv1]" },
	border_size = 0,
	rounding = 0,
})
hl.window_rule({
	name = "no-gaps-f1",
	match = { float = false, workspace = "f[1]" },
	border_size = 0,
	rounding = 0,
})
