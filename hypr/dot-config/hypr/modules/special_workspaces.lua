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
local gpt_workspace = "special:chatgpt"
hl.bind("SUPER + SHIFT + code:201", hl.dsp.workspace.toggle_special("chatgpt"))
hl.bind("Menu", hl.dsp.workspace.toggle_special("chatgpt"))

hl.window_rule({
    name = "chatgpt-scratchpad",
    match = { class = "Chatgpt" },
    float = true,
    workspace = gpt_workspace .. " silent",
    size = {1280, 720},
    move = {"monitor_w / 0.5", "monitor_h / 0.5"}
})


hl.on("workspace.created", function(ws)
    if ws.name ~= gpt_workspace then
        return
    end

    if ws.is_empty then
        hl.exec_cmd("chatgpt", { workspace = gpt_workspace })
    end
end)

-- Notion workspace
local notion_workspace = "special:notion"

hl.bind("SUPER + N", hl.dsp.workspace.toggle_special("notion"))
hl.window_rule({
    name = "notion-special-workspace",
    match = { class = "com.notion.app.desktop.notion" },
    float = true,
    workspace = notion_workspace,
    size = {1280, 720},
})


hl.on("workspace.created", function(ws)
    if ws.name ~= notion_workspace then
        return
    end

    if ws.is_empty then
        hl.exec_cmd("com.notion.app.desktop.notion", { workspace = notion_workspace })
    end
end)

-- Discord workspace
local discord_workspace = "special:discord"

hl.bind(MainMod .. "+ SHIFT + D", hl.dsp.workspace.toggle_special("discord"))
hl.window_rule({
    name = "discord-scratchpad",
    match = { class = "vesktop" },
    float = true,
    workspace = discord_workspace .. " silent",
    size = {1280, 720},
    move = {"monitor_w / 0.5", "monitor_h / 0.5"}
})


hl.on("workspace.created", function(ws)
    if ws.name ~= discord_workspace then
        return
    end

    if ws.is_empty then
        hl.exec_cmd("vesktop", { workspace = discord_workspace })
    end
end)

hl.workspace_rule({
    workspace = discord_workspace,
    persistent = true
})

-- Stop windows opening on special workspaces
hl.on("window.open", function (w)
    local special_workspace =  hl.get_active_special_workspace()

    if not special_workspace or special_workspace.name ~= "special:discord" then
        return
    end

    if w.class == "vesktop" then
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
    local active_ws = hl.get_active_workspace()
    if active_ws and active_ws.id == 20 then
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


-- Scrolling Experiment

hl.workspace_rule({
    workspace = "15",
    layout = "scrolling"
})

hl.config({
    scrolling = {
        column_width = 1.0,
        direction = "right",
        focus_fit_method = 1,
        wrap_focus = false,
    },
})
