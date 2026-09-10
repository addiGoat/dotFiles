require("modules.startup")


local mainMod = "ALT"

-- General Bindings
hl.bind(mainMod .. " + Q", hl.dsp.window.close())
hl.bind(mainMod .. " + RETURN", hl.dsp.exec_cmd(Terminal))
hl.bind(mainMod .. " + SHIFT + RETURN", hl.dsp.exec_cmd("gtk-launch $(xdg-settings get default-web-browser)"))
hl.bind(mainMod .. " + D", hl.dsp.exec_cmd(Launcher))
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd("kitty --title=kitty-float yazi ~"))

-- utils.bindSuper("F", hl.dsp.window.fullscreen({ mode="fullscreen", action="toggle" }))
-- utils.bindSuper("T", hl.dsp.window.float({ action="toggle"}))

hl.bind(mainMod .. " + h", hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + j", hl.dsp.focus({ direction = "down" }))
hl.bind(mainMod .. " + k", hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + l", hl.dsp.focus({ direction = "right" }))

hl.bind(mainMod .. " + SHIFT + h", hl.dsp.window.move({ direction = "left" }))
hl.bind(mainMod .. " + SHIFT + j", hl.dsp.window.move({ direction = "down" }))
hl.bind(mainMod .. " + SHIFT + k", hl.dsp.window.move({ direction = "up" }))
hl.bind(mainMod .. " + SHIFT + l", hl.dsp.window.move({ direction = "right" }))

-- Focus workspace with Mod+Number key
for i = 1, 5 do
	-- Alt+[1-5] for tiled workspace/main monitor
	hl.bind(mainMod .. " + " .. i , hl.dsp.focus({ workspace = i }))
	hl.bind(mainMod .. " + SHIFT + " .. i, hl.dsp.window.move({ workspace = i }))

	-- Super+[1-5] for floating workspace/second monitor
	hl.bind("SUPER + " .. i , hl.dsp.focus({ workspace = i + 5}))
	hl.bind("SUPER + SHIFT + " .. i, hl.dsp.window.move({ workspace = i + 5 }))
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
hl.bind("SUPER + mouse:272", hl.dsp.window.drag())
hl.bind("SUPER + mouse:273", hl.dsp.window.resize())

-- Screen Capture
hl.bind("SUPER + SHIFT + S", hl.dsp.exec_cmd("hyprshot -m region --freeze --clipboard-only"))
hl.bind(mainMod .. " + S", hl.dsp.exec_cmd("pkill -SIGUSR1 -f '^gpu-screen-recorder'"))

-- Laptop Lid Toggle
hl.bind("switch:[Lid Switch]", hl.dsp.exec_cmd("hyprlock"), { locked = true })
