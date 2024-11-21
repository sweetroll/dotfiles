local wezterm = require('wezterm')

local config = wezterm.config_builder()

config.font = wezterm.font("JetBrainsMono NF")
config.font_size = 19
config.color_scheme = 'Tomorrow (dark) (terminal.sexy)'
config.initial_cols = 100
config.initial_rows = 30

config.window_decorations = "INTEGRATED_BUTTONS|RESIZE"
config.front_end = "WebGpu"

-- Keybindings
config.keys = {
  -- Next tab
  {
      key = 'RightArrow',
      mods = 'CMD',
      action = wezterm.action.ActivateTabRelative(1),
  },
  {
      key = 'LeftArrow',
      mods = 'CMD',
      action = wezterm.action.ActivateTabRelative(-1),
  },
  {
      key = 'LeftArrow',
      mods = 'OPT',
      action = wezterm.action.ActivatePaneDirection 'Left',
  },
  {
      key = 'RightArrow',
      mods = 'OPT',
      action = wezterm.action.ActivatePaneDirection 'Right',
  },
  {
      key = 'UpArrow',
      mods = 'OPT',
      action = wezterm.action.ActivatePaneDirection 'Up',
  },
  {
      key = 'DownArrow',
      mods = 'OPT',
      action = wezterm.action.ActivatePaneDirection 'Down',
  },
  {
      key = 'd',
      mods = 'CMD',
      action = wezterm.action.SplitHorizontal { domain = 'CurrentPaneDomain' },
  },
  {
      key = 'D',
      mods = 'CMD',
      action = wezterm.action.SplitVertical { domain = 'CurrentPaneDomain' },
  },
  {
      key = 'w',
      mods = 'CMD',
      action = wezterm.action.CloseCurrentPane { confirm = false },
  },
  {
      key = 'W',
      mods = 'CMD',
      action = wezterm.action.CloseCurrentTab { confirm = true },
  },
}

config.colors = {
    tab_bar = {
      -- The color of the strip that goes along the top of the window
      -- (does not apply when fancy tab bar is in use)
      background = '#000000',

      -- The active tab is the one that has focus in the window
      active_tab = {
        -- The color of the background area for the tab
        bg_color = '#161819',
        -- The color of the text for the tab
        fg_color = '#c0c0c0',

        -- Specify whether you want "Half", "Normal" or "Bold" intensity for the
        -- label shown for this tab.
        -- The default is "Normal"
        intensity = 'Normal',

        -- Specify whether you want "None", "Single" or "Double" underline for
        -- label shown for this tab.
        -- The default is "None"
        underline = 'None',

        -- Specify whether you want the text to be italic (true) or not (false)
        -- for this tab.  The default is false.
        italic = false,

        -- Specify whether you want the text to be rendered with strikethrough (true)
        -- or not for this tab.  The default is false.
        strikethrough = false,
      },

      -- Inactive tabs are the tabs that do not have focus
      inactive_tab = {
        bg_color = '#000000',
        fg_color = '#808080',

        -- The same options that were listed under the `active_tab` section above
        -- can also be used for `inactive_tab`.
      },

      -- You can configure some alternate styling when the mouse pointer
      -- moves over inactive tabs
      inactive_tab_hover = {
        bg_color = '#252525',
        fg_color = '#909090',

        -- The same options that were listed under the `active_tab` section above
        -- can also be used for `inactive_tab_hover`.
      },

      -- The new tab button that let you create new tabs
      new_tab = {
        bg_color = '#000000',
        fg_color = '#808080',

        -- The same options that were listed under the `active_tab` section above
        -- can also be used for `new_tab`.
      },

      -- You can configure some alternate styling when the mouse pointer
      -- moves over the new tab button
      new_tab_hover = {
        bg_color = '#252525',
        fg_color = '#909090',

        -- The same options that were listed under the `active_tab` section above
        -- can also be used for `new_tab_hover`.
      },
    },
  }

wezterm.plugin
      .require('https://github.com/yriveiro/wezterm-tabs')
      .apply_to_config(config, { tabs = { tab_bar_at_bottom = false } })

return config