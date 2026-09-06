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
		workspace = "special-" .. name .. " silent",
		size = {1280, 720},
		move = {"monitor_w / 0.5", "monitor_h / 0.5"}
	})
end

function M.notify(content, duration)
	duration = duration or 3000

	hl.notification.create({
		text = content,
		timeout = duration
	})
end

function M.tableToString(tbl)
    local result = "{"
    for k, v in pairs(tbl) do
        result = result .. tostring(k) .. " = " .. tostring(v) .. ", "
    end
    result = result .. "}"
    return result
end

return M
