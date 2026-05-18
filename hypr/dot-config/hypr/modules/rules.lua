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
	rounding = 20,
	rounding_power = 2
})
