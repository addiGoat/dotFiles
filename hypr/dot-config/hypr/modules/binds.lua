require("modules.startup")

local utils = require("modules.utils")

utils.bind("Q", hl.dsp.window.close())
utils.bind("RETURN", hl.dsp.exec_cmd(Terminal))
utils.bind("SHIFT + RETURN", hl.dsp.exec_cmd("firefox"))
utils.bind("E", hl.dsp.exec_cmd(FileExplorer))
utils.bind("D", hl.dsp.exec_cmd(Launcher))

-- Move focus with Alt+Arrows
utils.bind("left", hl.dsp.focus({ direction = "left" }))
utils.bind("right", hl.dsp.focus({ direction = "right" }))
utils.bind("up", hl.dsp.focus({ direction = "up" }))
utils.bind("down", hl.dsp.focus({ direction = "down" }))

-- Move active window with Alt+Shift+Arrows
utils.bind("SHIFT + left", hl.dsp.window.move({ direction = "left" }))
utils.bind("SHIFT + right", hl.dsp.window.move({ direction = "right" }))
utils.bind("SHIFT + up", hl.dsp.window.move({ direction = "up" }))
utils.bind("SHIFT + down", hl.dsp.window.move({ direction = "down" }))

-- Focus workspace with Mod+Number key
for i = 1, 5 do
	-- Alt+[1-5] for tiled workspace/main monitor
	utils.bind(i, hl.dsp.focus({ workspace = i }))
	utils.bind("SHIFT + " .. i, hl.dsp.window.move({ workspace = i }))

	-- Super+[1-5] for floating workspace/second monitor
	utils.bindSuper(i, hl.dsp.focus({ workspace = i + 5}))
	utils.bindSuper("SHIFT + " .. i, hl.dsp.window.move({ workspace = i + 5 }))
end


-- Multimedia Keys
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"), { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),      { locked = true, repeating = true })
hl.bind("XF86AudioMute",        hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),     { locked = true, repeating = true })
hl.bind("XF86AudioMicMute",     hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),   { locked = true, repeating = true })
hl.bind("XF86MonBrightnessUp",  hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+"),                  { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown",hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-"),                  { locked = true, repeating = true })

-- Requires playerctl
hl.bind("XF86AudioNext",  hl.dsp.exec_cmd("playerctl next"),       { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay",  hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev",  hl.dsp.exec_cmd("playerctl previous"),   { locked = true })

-- Move/Resize windows
utils.bindSuper("mouse:272", hl.dsp.window.drag())
utils.bindSuper("mouse:273", hl.dsp.window.resize())

-- Screen Capture
utils.bindSuper("SHIFT + S", hl.dsp.exec_cmd("hyprshot -m region --clipboard-only"))

utils.bind("S", hl.dsp.exec_cmd("pkill -SIGUSR1 -f '^gpu-screen-recorder'"))


-- DEBUG
hl.bind("ALT + M", hl.dsp.exec_cmd("command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch 'hl.dsp.exit()'"))

