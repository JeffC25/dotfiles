local wezterm = require("wezterm")

local config = wezterm.config_builder()

local act = wezterm.action

-- config.color_scheme = 'OneHalfDark'
config.color_scheme = 'Monokai Pro (Gogh)'

config.window_padding = {
  left = 32,
  right = 32,
  top = 1,
  bottom = 0.5
}

config.font = wezterm.font('JetBrainsMono Nerd Font')

-- config.background = {
-- 	{
-- 		source = { File = "Users/jeff/Pictures/wallpaper/Flow_Wallpaper_Mac.png" },
--
-- 		hsb = { brightness = 0.02, saturation = 0.85 },
-- 	},
-- }

-- config.window_background_opacity = 0.9
-- config.macos_window_background_blur = 100

config.hide_tab_bar_if_only_one_tab = true

config.use_fancy_tab_bar = false
config.colors = {
  tab_bar = {
    background = '#2d2a2e',
    active_tab = {
      bg_color = '#89b4fa',
      fg_color = '#11111b'
    },
    inactive_tab = {
      bg_color = '#2d2a2e',
      fg_color = '#cdd6f4'
    }
  }
}
config.tab_max_width = 32

config.mouse_bindings = {
  -- Disable the default click behavior
  {
    event = { Up = { streak = 1, button = "Left"} },
    mods = "NONE",
    action = wezterm.action.DisableDefaultAssignment,
  },
  -- Ctrl-click will open the link under the mouse cursor
  {
      event = { Up = { streak = 1, button = "Left" } },
      mods = "CTRL",
      action = wezterm.action.OpenLinkAtMouseCursor,
  },
  -- Disable the Ctrl-click down event to stop programs from seeing it when a URL is clicked
  {
      event = { Down = { streak = 1, button = "Left" } },
      mods = "CTRL",
      action = wezterm.action.Nop,
  },
}

config.keys = {
  -- Create new splits
  {
    key = '\'',
    mods = 'CTRL|CMD',
    action = wezterm.action.SplitHorizontal { domain = 'CurrentPaneDomain' },
  },
  {
    key = ';',
    mods = 'CTRL|CMD',
    action = wezterm.action.SplitVertical { domain = 'CurrentPaneDomain' },
  },
  -- Close current pane
  {
    key = 'w',
    mods = 'CTRL|CMD',
    action = wezterm.action.CloseCurrentPane { confirm = true },
  },
  -- Focus pane (hjkl)
  {
    key = 'h',
    mods = 'CTRL|CMD',
    action = act.ActivatePaneDirection 'Left',
  },
  {
    key = 'l',
    mods = 'CTRL|CMD',
    action = act.ActivatePaneDirection 'Right',
  },
  {
    key = 'k',
    mods = 'CTRL|CMD',
    action = act.ActivatePaneDirection 'Up',
  },
  {
    key = 'j',
    mods = 'CTRL|CMD',
    action = act.ActivatePaneDirection 'Down',
  },
}

return config
