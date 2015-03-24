-- {{{ Tags

local supernums = { "¹", "²", "³", "⁴", "⁵", "⁶", "⁷", "⁸", "⁹" }

-- Update tag text
update_tags = function()
  for s = 1, screen.count() do
    -- Reset all tag text
    local atags = awful.tag.gettags(s)
    for i, t in ipairs(atags) do
      t.name = "  ○" .. supernums[i] .. "  "
    end

    -- Fill tag circles with clients
    local clist = client.get(s)
    for i, c in ipairs(clist) do
      local ctags = c:tags()
      for j, t in ipairs(ctags) do
        t.name = "  ●" .. supernums[awful.tag.getidx(t)] .. "  "
      end
    end
  end
end

-- Define a tag table which hold all screen tags.
tags = {}
tags[1] = awful.tag({'  ○¹  ', '  ○²  ', '  ○³  ', '  ○⁴  ', '  ○⁵  ',
                     '  ○⁶  ', '  ○⁷  ', '  ○⁸  ', '  ○⁹  '}, 1, layouts[1])
for s = 2, screen.count() do
    -- Tag tables for secondary screens.
    tags[s] = awful.tag({
      '  ○¹  ',
      '  ○²  ',
      '  ○³  ',
      '  ○⁴  ',
      '  ○⁵  ',
      '  ○⁶  ',
      '  ○⁷  ',
      '  ○⁸  ',
      '  ○⁹  '}, s, layouts[1])
end
-- }}}

