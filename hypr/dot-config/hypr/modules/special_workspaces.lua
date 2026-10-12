-- General Purpose Scratchpad
hl.bind("ALT + GRAVE", hl.dsp.workspace.toggle_special("scratchpad"))

-- Move window to scratchpad and make it float
hl.bind("ALT + SHIFT + GRAVE", function()
    local window = hl.get_active_window()
    if window ~= nil and window.floating == false then
        hl.dispatch(hl.dsp.window.float({ action = "set"}))
    end
    hl.dispatch(hl.dsp.window.move({ workspace = "special:scratchpad", window = window}))
end)

-- Chatgpt workspace
hl.bind("SUPER + SHIFT + code:201", hl.dsp.workspace.toggle_special("chatgpt"))
hl.bind("Menu", hl.dsp.workspace.toggle_special("chatgpt"))

hl.window_rule({
    name = "chatgpt-scratchpad",
    match = { class = "Chatgpt" },
    float = true,
    workspace = "special:chatgpt silent",
    size = {1280, 720},
    move = {"monitor_w / 0.5", "monitor_h / 0.5"}
})

hl.workspace_rule({
    workspace = "special:chatgpt",
    on_created_empty = "chatgpt",
})

-- Discord workspace
hl.bind(MainMod .. "+ SHIFT + D", hl.dsp.workspace.toggle_special("discord"))

hl.window_rule({
    name = "discord-scratchpad",
    match = { class = "vesktop" },
    float = true,
    workspace = "special:discord silent",
    size = {1280, 720},
    move = {"monitor_w / 0.5", "monitor_h / 0.5"}
})

hl.workspace_rule({
    workspace = "special:discord",
    on_created_empty = "vesktop",
    persistent = true
})

-- Stop windows opening on discord workspace
hl.on("window.open", function (w)
    local special_workspace =  hl.get_active_special_workspace()

    if not special_workspace then
        return
    end

    if special_workspace.name == "special:discord" and w.class == "vesktop" then
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

-- Game Workspace
hl.bind("SUPER + G", hl.dsp.focus({ workspace = 20 }))
hl.bind("SUPER + SHIFT + G", hl.dsp.window.move({ workspace = 20 }))

-- Stop normal windows from opening on game workspace
hl.on("window.open", function(w)
    -- 20 is the game workspace
    if hl.get_active_workspace().id == 20 then
        if w.tags == nil then
            return
        end

        -- check all tags of opened window
        for _, value in pairs(w.tags) do
            -- if any tag has the value "game", cancel the function
            if value == "game" or value == "game*" then
                return
            end
        end
        -- otherwise move the window to a default workspace
        hl.dispatch(hl.dsp.window.move({ workspace = 1, window = w }))

    end
end)
