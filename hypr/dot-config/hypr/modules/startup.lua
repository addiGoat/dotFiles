-- GLOBAL VARIABLES --
Terminal = "kitty"
Launcher = "rofi -show drun"
FileExplorer = "nautilus"

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
end)
