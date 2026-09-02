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
