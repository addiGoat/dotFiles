local rofi_script_dir = "/home/addigoat/.config/rofi/scripts"

local function bindRofi(super, key, name)
	hl.bind(super .. " + " .. key, hl.dsp.exec_cmd(rofi_script_dir .. "/rofi-" .. name))
end

-- Command Palette
bindRofi("ALT", "SHIFT + P", "palette")

-- Website launcher
bindRofi("ALT", "SHIFT + L", "launch")

-- Power
bindRofi("ALT", "SHIFT + X", "power")
