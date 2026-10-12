local env = require("modules.env")


-- Bind workspaces to monitors
local monitor_one = "DP-1"
local monitor_two = "HDMI-A-1"

if env.is_laptop then
    monitor_one = "eDP-1"
end

for i = 1, 5 do
    hl.workspace_rule({
        workspace = tostring(i),
        monitor = monitor_one,
        default = true,
    })
end
for i = 6, 10 do
    hl.workspace_rule({
        workspace = tostring(i),
        monitor = monitor_two,
        default = true,
    })
end

-- Monitor advanced configuration
if env.is_desktop then
    -- Desktop
	hl.monitor({
		output = "DP-1",
		mode = "2560x1440@164.96",
		position = "1920x0",
		scale = "1",
	})

	hl.monitor({
		output = "HDMI-A-1",
		mode = "1920x1080@180",
		position = "0x360",
		scale = "1",
	})

    hl.config({
        cursor = {
            default_monitor = "DP-1",
        },
    })
else
    -- Laptop
	hl.monitor({
		output = "eDP-1",
		mode = "2560x1600@165",
		position = "2560x730",
		scale = "1",
	})

	hl.monitor({
		output = "eDP-2",
		mode = "2560x1600@165",
		position = "2560x730",
		scale = "1",
	})

	hl.monitor({
		output = "HDMI-A-1",
		mode = "2560x1440@144.00Hz",
		position = "0x360",
		scale = "1",
	})
end
