local wezterm = require 'wezterm'
local config = wezterm.config_builder()

-- 隐藏标题栏，但保留可调整窗口大小的功能
config.window_decorations = "INTEGRATED_BUTTONS|RESIZE"
config.font = wezterm.font("SauceCodePro Nerd Font Mono")
config.font_size = 12.0
config.initial_rows = 40  -- 设置默认行数
config.initial_cols = 160 -- 设置默认列数
config.color_scheme = 'Tokyo Night'
config.use_resize_increments = true

config.keys = {
  {
    key = 'w',
    mods = 'CTRL',
    action = wezterm.action.CloseCurrentTab { confirm = true },
  },
}
return config

