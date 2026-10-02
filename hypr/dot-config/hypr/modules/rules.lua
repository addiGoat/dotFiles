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

	for i = 1, 5 do
		hl.workspace_rule({
			workspace = tostring(i),
			monitor = "HDMI-A-1",
			default = true,
		})
	end
	for i = 6, 10 do
		hl.workspace_rule({
			workspace = tostring(i),
			monitor = "eDP-1",
			default = true,
		})
	end
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


