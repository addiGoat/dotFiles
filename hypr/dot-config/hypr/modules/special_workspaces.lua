local utils = require("modules.utils")
local mainMod = "ALT"


local gpt_keybind
local env = require("modules.env")
if env.is_desktop then
    gpt_keybind = "Menu"
else
    gpt_keybind = "SUPER + SHIFT + code:201"
end

-- Basic special workspaces
utils.make_special(mainMod, "SHIFT + D", "vesktop", "vesktop", "vesktop")
utils.make_special("SUPER", "B", "bitwarden", "Bitwarden", "bitwarden-desktop")
utils.make_special("", gpt_keybind, "chatgpt", "Chatgpt", "chatgpt")

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

-- notion workspace ig
hl.on("hyprland.start", function ()
    hl.exec_cmd("/home/addigoat/.local/bin/notion-webapp")
end)
hl.bind("SUPER + N", hl.dsp.workspace.toggle_special("notion"))

hl.window_rule({
    name = "notion" .. "-scratchpad",
    match = {
        class = "firefox.webapp-db186b57-fe73-4c81-8dd8-c2492983a412",
    },
    float = true,
    workspace = "special-notion silent",
    size = {1280, 720},
    move = {"monitor_w / 0.5", "monitor_h / 0.5"}
})
