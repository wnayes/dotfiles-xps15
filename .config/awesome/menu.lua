-- {{{ Menu
-- Setup the right click menu

local awesomemenu = {
  { "manual", terminal .. " -e man awesome" },
  { "reload", awesome.restart },
  { "exit", awesome.quit },
  { "reboot", "systemctl reboot" },
  { "showdown", "systemctl shutdown" }
}
local web = {
  { "firefox", "firefox" }
}

mymainmenu = awful.menu({
  items = {
    { "awesome", awesomemenu, beautiful.awesome_icon },
    { "web", web }
  }
})
