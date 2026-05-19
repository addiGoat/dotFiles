local rofi_script_dir = "/home/addigoat/.config/rofi/scripts"

local function bindRofi(super, key, name)
	hl.bind(super .. " + " .. key, hl.dsp.exec_cmd(rofi_script_dir .. "/rofi-" .. name))
end

-- Website launcher
bindRofi("ALT", "SHIFT + L", "launch")

-- Notes
bindRofi("ALT", "SHIFT + N", "notes")

-- Power
bindRofi("ALT", "SHIFT + X", "power")
