local scripts = {
    {
        bind = "SUPER + P",
        name = "palette-launcher"
    },
    {
        bind = "SUPER + M",
        name = "launch"
    },
    {
        bind = "SUPER + X",
        name = "power"
    },
    {
        bind = "SUPER + S",
        name = "replay"
    },
}

local rofi_script_dir = "/home/addigoat/.config/rofi/scripts"

for _, script in ipairs(scripts) do
    hl.bind(script.bind, hl.dsp.exec_cmd(rofi_script_dir .. "/" .. script.name))
end
