local env = require("modules.env")

if env.is_desktop then
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
	hl.monitor({
		output = "eDP-1",
		mode = "2560x1600@165",
		position = "0x0",
		scale = "1",
	})

	hl.monitor({
		output = "HDMI-A-1",
		mode = "1920x1080@60",
		position = "2560x0",
		scale = "1",
	})
end
