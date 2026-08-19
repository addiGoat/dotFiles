local utils = require("modules.utils")
local mainMod = "ALT"

utils.make_special(mainMod, "SHIFT + D", "vesktop", "vesktop", "vesktop")

-- Game Workspace

utils.bindSuper("G", hl.dsp.focus({ workspace = 20 }))

-- EXPERIMENT
-- stop normal windows from opening on game workspace
--
-- hl.on("window.open", function(w)
--     if hl.get_active_workspace().id == 20 then
--         hl.exec_cmd('notify-send "window_early" "fuck you"')
--         if w.tag ~= "game" then
--             hl.dispatch(hl.dsp.window.move({ workspace = 1, window = w }))
--         end
--     end
-- end)
