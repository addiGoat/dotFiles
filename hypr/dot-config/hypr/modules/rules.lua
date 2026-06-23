local env = require("modules.env")

if env.is_desktop then
	--------------------------
	---- DESKTOP SPECIFIC ----
	--------------------------
	for i = 1, 5 do
		hl.workspace_rule({
			workspace = tostring(i),
			monitor = "DP-1",
			default = true,
		})
	end
	for i = 6, 10 do
		hl.workspace_rule({
			workspace = tostring(i),
			monitor = "HDMI-A-1",
			default = true,
		})
	end
else
	-------------------------
	---- LAPTOP SPECIFIC ----
	-------------------------
	hl.window_rule({
		name = "floating-environment",
		match = { workspace = "r[6-10]" },
		float = true,
		size = {1920, 1080}
	})
end
	------------------------
	---- GENERAL RULES  ----
	------------------------

hl.window_rule({
	name = "style-floating-windows",
	match = { float = true },
	rounding = 10,
	rounding_power = 2
})

-- for secondary windows, like settings menu or friends popup
hl.window_rule({
	name = "make-windows-float",
	match = {
		class = "^(steam|org.kde.kdenlive)$",
	},
	float = true
})

hl.window_rule({
    name = "make-kden-square",
    match = { class = "org.kde.kdenlive" },
    rounding = 0,
    ["hyprbars:no_bar"] = true
})

-- keep the main window tiled
hl.window_rule({
	name = "tile-main-steam",
	match = { title = "^(Steam)$" },
	float = false
})

hl.window_rule({
	name = "float-obs-stats",
	match = { title = "Stats", class = "com.obsproject.Studio" },
	float = true,

	size = {665, 255}
})

hl.window_rule({
    name = "opaque-youtube-windows",
    match = { title = ".* - YouTube.*" },
    opaque = true
})

hl.window_rule({
    name = "float-various-util-windows",
    match = { title = "kitty-float" },
    float = true,
    size = {1280, 720},
    opaque = true
})

hl.window_rule({
    name = "float mpv",
    match = { class = "mpv" },
    float = true,
    size = {1280, 720},
    opaque = true,

    rounding = 0,
    ["hyprbars:no_bar"] = true
})


hl.window_rule({
    name = "yarg",
    match = { title = "YARG" },
    float = true,
    opaque = true
})

hl.window_rule({
    name = "raylib windows",
    match = { title = "freddy-duty" },

    float = true,
    center = true,
    monitor = "DP-1",
    rounding = 0
})
