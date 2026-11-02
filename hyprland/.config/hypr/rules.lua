local special_kitty = {
	["special:term"] = {
		"kitty",
		{
			float = true,
			center = true,
			dim_around = true,
			size = { "(monitor_w*0.6)", "(monitor_h*0.6)" },
		},
	},
}

hl.on("workspace.created", function(ws)
	if not ws.is_empty then
		return
	end

	local program = special_kitty[ws.name]
	if program == nil then
		return
	end

	local cmd, rules = table.unpack(program)
	-- shallow-copy the rules table so we can add the workspace to it
	local rules2 = {}
	for k, v in pairs(rules) do
		rules2[k] = v
	end
	rules2.workspace = ws.name .. " silent"
	-- run it!
	hl.exec_cmd(cmd, rules2)
end)

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

hl.window_rule({
	name = "qbittorrent-download",
	match = {
		class = "org.qbittorrent.qBittorrent",
		title = "negative:qBittorrent v.+",
	},
	float = true,
	center = true,
	size = { 1500, 1000 },
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
