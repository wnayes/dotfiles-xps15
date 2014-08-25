-- {{{ Tags
-- Define a tag table which hold all screen tags.
tags = {}
tags[1] = awful.tag({'  1  ', '  2  ', '  3  ', '  4  ', '  5  ',
                     '  6  ', '  7  ', ' IM ', "Email"}, 1, layouts[1])
for s = 2, screen.count() do
    -- Tag tables for secondary screens..
    tags[s] = awful.tag({
      '  1  ',
      '  2  ',
      '  3  ',
      '  4  ',
      '  5  ',
      '  6  ',
      '  7  ',
      '  8  ',
      '  9  '}, s, layouts[1])
end
-- }}}

