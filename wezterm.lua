local wezterm = require 'wezterm'

return {
  font = wezterm.font_with_fallback {
    "FiraCode Nerd Font Mono",
    "Menlo",
    "monospace"
  },
  font_size = 14.0,
  line_height = 1.2,
  -- Kitty: adjust_column_width 100% entspricht Standard
  -- Ligaturen: Kitty "never", WezTerm "false"
  harfbuzz_features = {"calt=0", "clig=0", "liga=0"},
  enable_tab_bar = true,
  hide_tab_bar_if_only_one_tab = true,
  tab_bar_at_bottom = true,
  use_fancy_tab_bar = true,
  window_decorations = "RESIZE",
  window_padding = {
    left = 6, right = 6, top = 6, bottom = 6,
  },
  color_scheme = "Night Owl (Gogh)", -- Alternativ: eigene Farben unten
  colors = {
    foreground = "#d0d0d0",
    background = "#1e1e1e",
    selection_fg = "#000000",
    selection_bg = "#c0c0c0",
    ansi = {
      "#1e1e1e", "#d54e53", "#b9ca4a", "#e6c547",
      "#7aa6da", "#c397d8", "#70c0ba", "#eaeaea",
    },
    brights = {
      "#666666", "#ff3334", "#9ec400", "#e7c547",
      "#7aa6da", "#b77ee0", "#54ced6", "#ffffff",
    },
  },
  cursor_blink_rate = 0,
  default_cursor_style = "BlinkingBlock",
  -- macOS: Option as Alt
  send_composed_key_when_left_alt_is_pressed = true,
  send_composed_key_when_right_alt_is_pressed = true,
  -- Key bindings
  keys = {
    {key="n", mods="ALT", action=wezterm.action{SendString="~"}},
    {key="c", mods="CMD", action=wezterm.action.CopyTo "Clipboard"},
    {key="v", mods="CMD", action=wezterm.action.PasteFrom "Clipboard"},
    {key="t", mods="CMD", action=wezterm.action.SpawnTab "CurrentPaneDomain"},
    {key="w", mods="CMD", action=wezterm.action.CloseCurrentTab{confirm=true}},
    {key="]", mods="CMD|SHIFT", action=wezterm.action.ActivateTabRelative(1)},
    {key="[", mods="CMD|SHIFT", action=wezterm.action.ActivateTabRelative(-1)},
    {key="Enter", mods="CMD", action=wezterm.action.ToggleFullScreen},
  },
  scrollback_lines = 20000,
  audible_bell = "Disabled",
  -- Performance
  animation_fps = 60,
  max_fps = 60,
  -- Clipboard
  -- strip_trailing_spaces_in_selection = true, -- entfernt, da ungültig

  -- Multi-session (Multiplexing) Support
  unix_domains = {
    {
      name = "unix",
    },
  },
  default_gui_startup_args = { "connect", "unix" },
}
