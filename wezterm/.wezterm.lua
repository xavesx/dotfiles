-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()

-- Fullscreen on startup
local mux = wezterm.mux
wezterm.on('gui-startup', function(cmd)
  local tab, pane, window = mux.spawn_window(cmd or {})
  window:gui_window():toggle_fullscreen()
end)

config = {
    automatically_reload_config = true,
    enable_tab_bar = true,
    use_fancy_tab_bar = false,
    tab_bar_at_bottom = true,
    window_decorations = "RESIZE",
    font = wezterm.font('SFMono Nerd Font', {weight = "Light"}),
    font_size = 20,
    color_scheme = 'Gruvbox Material (Gogh)',
    -- color_scheme = 'Gotham (Gogh)',
    -- color_scheme = 'GruvboxDark',a
    -- window_background_opacity = 0.4,
    -- macos_window_background_blur = 60,
    window_close_confirmation = "NeverPrompt",
    -- default_cursor_style = "BlinkingBar",
    -- window:set_position(640, 300) # ERROR if uncomment
}
-- Toggle fullscreen
config.keys = {
    {
      key = 'f',
      mods = 'CTRL',
      action = wezterm.action.ToggleFullScreen,
    },
  }

-- To enable maximize window on startup
-- local mux = wezterm.mux
-- wezterm.on("gui-startup", function(cmd)
--     local tab, pane, window = mux.spawn_window(cmd or {})
--     window:gui_window():maximize()
-- end)

return config
