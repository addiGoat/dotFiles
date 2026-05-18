local M = {}

function M.make_special(mod, key, name, class, cmd)
	hl.on("hyprland.start", function ()
		hl.exec_cmd(cmd)
	end)

	hl.bind(mod .. " + " .. key, hl.dsp.workspace.toggle_special(name))

	hl.window_rule({
		name = name .. "-scratchpad",
		match = { class = class },
		float = true,
		workspace = "special:" .. name .. " silent",
		size = {1280, 720},
		move = {"monitor_w / 0.5", "monitor_h / 0.5"}
	})
end

return M

