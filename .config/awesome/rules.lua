-- {{{ Rules
awful.rules.rules = {
    -- All clients will match this rule.
    { rule = { },
      properties = { border_width = beautiful.border_width,
                     border_color = beautiful.border_normal,
                     focus = awful.client.focus.filter,
                     keys = clientkeys,
                     buttons = clientbuttons } },
    { rule = { class = "MPlayer" },
      properties = { floating = true } },
    { rule = { class = "pinentry" },
      properties = { floating = true } },
    { rule = { class = "gimp" },
      properties = { floating = true } },
    -- Set Firefox to always map on tags number 2 of screen 1.
    -- { rule = { class = "Firefox" },
    --   properties = { tag = tags[1][2] } },

    -- Instantbird layout with buddy list and account manager
    -- { rule = { class = "Instantbird" },
    --  properties = { tag = tags[1][8] } },

    -- Thunderbird on last tag.
    { rule = { class = "Thunderbird" },
      properties = { tag = tags[1][9] } },

    -- Desktop web background.
    { rule = { class = "Nw" },
      properties = { below = true,
                     maximized = true,
                     -- x = 0,
                     --y = 19,
                     -- height = 1061,
                     -- width = 3840,
                    -- floating = true,
                     sticky = true,
                     -- focusable = false,
                     border_width = 0,
                     skip_taskbar = true } },
}

