local mainMod = "SUPER" -- Sets "Windows" key as main modifier

hl.bind(mainMod .. " + RETURN", hl.dsp.exec_cmd(Terminal))
hl.bind(mainMod .. " + Q", hl.dsp.window.close())
hl.bind(mainMod .. " + M", hl.dsp.exec_cmd("command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch 'hl.dsp.exit()'"))
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd(FileManager))
hl.bind(mainMod .. " + V", hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. " + F", hl.dsp.window.fullscreen({mode = "fullscreen", action = "toggle", window = "active_window"}))
hl.bind(mainMod .. " + SPACE", hl.dsp.exec_cmd(Menu))
hl.bind(mainMod .. " + W", hl.dsp.exec_cmd(Browser))

-- Move focus with mainMod + arrow keys
hl.bind(mainMod .. " + left",  hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + right", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + up",    hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + down",  hl.dsp.focus({ direction = "down" }))

hl.bind(mainMod .. " + H",  hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + L", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + K",    hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + J",  hl.dsp.focus({ direction = "down" }))

hl.bind(mainMod .. " + O", hl.dsp.layout("togglesplit"))

-- refresh waybar
hl.bind(mainMod .. " + SHIFT + B", hl.dsp.exec_cmd("~/.dotfiles/waybar/.config/waybar/launch.sh"))

-- toggle fcitx5 language
hl.bind("CONTROL + SPACE", hl.dsp.exec_cmd("fcitx5-remote -t && pkill -RTMIN+5 waybar"))

-- Volume control, using pamixer
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("changevolume up"), { repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("changevolume down"), { repeating = true })
hl.bind("XF86AudioMute",        hl.dsp.exec_cmd("changevolume mute"), { locked = true })
-- hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+"), { repeating = true })
-- hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"), { repeating = true })
-- hl.bind("XF86AudioMute",        hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"), { locked = true })

-- Requires playerctl
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"),   { locked = true })
hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"),       { locked = true })

hl.bind("XF86MonBrightnessUp",   hl.dsp.exec_cmd("changebrightness up"), { locked = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("changebrightness down"), { locked = true })

hl.bind(mainMod .. " + SHIFT + L", hl.dsp.exec_cmd("hyprlock"))

-- Screenshots with grimblast
hl.bind(mainMod .. " + P", hl.dsp.exec_cmd("grimblast --notify save screen"))
hl.bind(mainMod .. " + SHIFT + P", hl.dsp.exec_cmd("grimblast --notify save area"))

-- Switch workspaces with mainMod + [0-9]
-- Move active window to a workspace with mainMod + SHIFT + [0-9]
for i = 1, 10 do
    local key = i % 10 -- 10 maps to key 0
    hl.bind(mainMod .. " + " .. key,             hl.dsp.focus({ workspace = i}))
    hl.bind(mainMod .. " + SHIFT + " .. key,     hl.dsp.window.move({ workspace = i }))
end

hl.bind(mainMod .. " + S", hl.dsp.workspace.toggle_special("term"))
hl.bind(mainMod .. " + D", hl.dsp.workspace.toggle_special("other"))
hl.bind(mainMod .. " + SHIFT + D", hl.dsp.window.move({ workspace = "special:other" }))

-- # special workspaces (scratchpad)
-- bind = $mainMod, S, togglespecialworkspace, term
-- bind = $mainMod, D, togglespecialworkspace, other
-- bind = $mainMod SHIFT, D, movetoworkspace, special:other

-- # Scroll through existing workspaces with mainMod + scroll
-- bind = $mainMod, mouse_down, workspace, e+1
-- bind = $mainMod, mouse_up, workspace, e-1

-- Move/resize windows with mainMod + LMB/RMB and dragging
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(),   { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })
hl.bind(mainMod .. " + SHIFT + mouse:272", hl.dsp.window.resize(), { mouse = true })
