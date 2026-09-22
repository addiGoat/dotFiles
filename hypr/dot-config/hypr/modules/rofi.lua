local rofi_script_dir = "/home/addigoat/.config/rofi/scripts"

local function bindRofi(super, key, name)
	hl.bind(super .. " + " .. key, hl.dsp.exec_cmd(rofi_script_dir .. "/rofi-" .. name))
end

-- Command Palette
-- hl.bind("ALT + SHIFT + P", function()
--     local window = hl.get_active_window()
--     if window and window.class ~= "UnrealEditor" then
--         hl.exec_cmd(rofi_script_dir .. "/rofi-powerbar")
--         return true
--     end
-- end, {
--     auto_consuming = true,
-- })

bindRofi("SUPER", "P", "palette")

-- Website launcher
bindRofi("SUPER", "M", "launch")

-- Power Menu
bindRofi("SUPER", "X", "power")

-- Powerbar
bindRofi("ALT", "semicolon", "powerbar")

-- Replay
bindRofi("SUPER", "S", "replay")

-- Config editor
bindRofi("SUPER", "E", "config")
