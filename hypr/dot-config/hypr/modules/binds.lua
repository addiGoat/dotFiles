require("modules.startup")
local mainMod = "ALT"

local function bind(key, dispatch, args)
	hl.bind(mainMod .. " + " .. key, dispatch, args or {})
end

local function bindSuper(key, dispatch, args)
	hl.bind("SUPER + " .. key, dispatch, args or {})
end

bind("Q", hl.dsp.window.close())
bind("RETURN", hl.dsp.exec_cmd(Terminal))
bind("E", hl.dsp.exec_cmd(FileExplorer))
bind("D", hl.dsp.exec_cmd(Launcher))

-- Move focus with Alt+Arrows
bind("left", hl.dsp.focus({ direction = "left" }))
bind("right", hl.dsp.focus({ direction = "right" }))
bind("up", hl.dsp.focus({ direction = "up" }))
bind("down", hl.dsp.focus({ direction = "down" }))

-- Move active window with Alt+Shift+Arrows
bind("SHIFT + left", hl.dsp.window.move({ direction = "left" }))
bind("SHIFT + right", hl.dsp.window.move({ direction = "right" }))
bind("SHIFT + up", hl.dsp.window.move({ direction = "up" }))
bind("SHIFT + down", hl.dsp.window.move({ direction = "down" }))

-- Focus workspace with Mod+Number key
for i = 1, 5 do
	-- Alt+[1-5] for tiled workspace/main monitor
	bind(i, hl.dsp.focus({ workspace = i }))
	bind("SHIFT + " .. i, hl.dsp.window.move({ workspace = i }))

	-- Super+[1-5] for floating workspace/second monitor
	bindSuper(i, hl.dsp.focus({ workspace = i + 5}))
	bindSuper("SHIFT + " .. i, hl.dsp.window.move({ workspace = i + 5 }))
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
bindSuper("mouse:272", hl.dsp.window.drag())
bindSuper("mouse:273", hl.dsp.window.resize())

-- Screen Capture
bindSuper("SHIFT + S", hl.dsp.exec_cmd("hyprshot -m region --clipboard-only"))


-- DEBUG
hl.bind(mainMod .. " + M", hl.dsp.exec_cmd("command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch 'hl.dsp.exit()'"))

