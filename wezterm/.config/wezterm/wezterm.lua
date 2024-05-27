local wezterm = require 'wezterm'

local config = wezterm.config_builder()

config.initial_rows = 30
config.initial_cols = 96

config.color_scheme = 'Catppuccin Mocha'

config.window_background_opacity = 0.96

config.font = wezterm.font('FiraCode Nerd Font')
config.font_size = 13

config.default_cursor_style = 'SteadyBar'

config.keys = {
    {
        key = 'w',
        mods = 'SHIFT|CTRL',
        action = wezterm.action.CloseCurrentTab { confirm = false},
    },
    {
        key = 'w',
        mods = 'CTRL',
        action = wezterm.action.CloseCurrentPane { confirm = false},
    },
    {
        key = 't',
        mods = 'CTRL',
        action = wezterm.action.SpawnTab 'CurrentPaneDomain'
    }
}

config.use_fancy_tab_bar = false
config.hide_tab_bar_if_only_one_tab = true
config.show_new_tab_button_in_tab_bar = false
config.window_decorations = 'RESIZE'

return config
