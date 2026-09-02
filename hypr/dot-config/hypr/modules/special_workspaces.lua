local utils = require("modules.utils")
local mainMod = "ALT"

utils.make_special(mainMod, "SHIFT + D", "vesktop", "vesktop", "vesktop")

utils.make_special("SUPER", "B", "bitwarden", "Bitwarden", "bitwarden-desktop")

-- Game Workspace
utils.bindSuper("G", hl.dsp.focus({ workspace = 20 }))
utils.bindSuper("SHIFT + G", hl.dsp.window.move({ workspace = 20 }))

-- EXPERIMENT
-- stop normal windows from opening on game workspace

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

-- hl.on("window.open", function(w)
--     hl.notification.create({ text = utils.tableToString(w.tags), timeout = 5000 })
--     print(w)
-- end)
--

local previous_workspace = nil
local gpt_workspace = 21
hl.bind("SUPER + SHIFT + code:201", function()
    local current = hl.get_active_workspace()

    if not current then
        return
    end

    -- Debug
    hl.notification.create({
        text = tostring(current.id),
        timeout = 5000
    })
    -- Debug

    if current.id == gpt_workspace then
        hl.dispatch(hl.dsp.focus({ workspace = previous_workspace }))
    else
        previous_workspace = current.id
        hl.dispatch(hl.dsp.focus({ workspace = gpt_workspace }))
    end


end)
