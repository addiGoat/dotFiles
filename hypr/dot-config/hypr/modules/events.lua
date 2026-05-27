--local utils = require("modules.utils")

hl.on("window.open", function (w)

	if hl.get_active_special_workspace() == nil then
		return
	end

	local ws = hl.get_active_workspace()

	hl.dispatch(
		hl.dsp.window.move({
			workspace = ws,
			window = w
		})
	)

end)

--hl.on("window.open_early", function (w)
--	hl.notification.create({
--		text = "title: " .. w.title .. ", address: " .. w.address,
--		duration = 4000
--	})
--end)
