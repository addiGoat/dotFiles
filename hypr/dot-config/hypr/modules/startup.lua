local env = require("modules.env")

local monitor

if env.is_desktop then
    monitor = "DP-1"
else
    monitor = "eDP-1"
end
-- GLOBAL VARIABLES --
Terminal = "kitty"
Launcher = "rofi -show drun"
FileExplorer = "yazi"

-- ENVIRONMENT VARIABLES --
	hl.env("HYPRCURSOR_SIZE", "24")
	hl.env("HYPRCURSOR_THEME", "moga")
	hl.env("XCURSOR_SIZE", "24")
	hl.env("XCURSOR_THEME", "moga")
	hl.env("TERMINAL", "kitty")
	hl.env("EDITOR", "nvim")


-- AUTOSTART --
hl.on("hyprland.start", function ()
	hl.exec_cmd("waybar")
	hl.exec_cmd("hyprpm reload")
	hl.exec_cmd(
		"mpvpaper -o \"--loop panscan=1 input-ipc-server=/tmp/mpv-socket\" ALL ~/Pictures/Wallpapers/NightFox.png"
	)
    hl.exec_cmd("gpu-screen-recorder -w " .. monitor .. " -f 60 -a default_output -a default_input -q very_high -r 300 -o ~/Videos/Replays -c mkv -sc $HOME/scripts/save-replay")
end)
