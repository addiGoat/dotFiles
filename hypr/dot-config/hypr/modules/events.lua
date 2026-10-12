-- Stop windows opening on special workspaces (minus general scratchpad)
hl.on("window.open", function (w)

	if hl.get_active_special_workspace() == nil
    or hl.get_active_special_workspace().name == "special:scratchpad" then
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
