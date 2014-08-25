-- Launch some chromeless web browsers for each desktop.

-- Check whether these have already been launched, and keep track of the pids
-- if they have not.
local dpids = {}
if execute_command("pgrep nw") ~= nil then
    for s = 1, screen.count() do
        dpids[awful.util.spawn_with_shell("nw ~/Desktop "
              .. s .. " " .. screen[s].geometry.x)] = { screen = s }
    end

    client.connect_signal("manage", function(c)
        if dpids[c.pid] ~= nil then
            c.screen = dpids[c.pid].screen
        end
    end)
end

