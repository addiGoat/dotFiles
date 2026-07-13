#!/usr/bin/env fish

hyprctl dispatch 'hl.dsp.exec_cmd("kitty tail -f /home/addigoat/Projects/Engines/Kristal/kristal.log",
    {
        monitor = "DP-1",
        float = true,
        move = {100, 1100},
        size = {2520, 320},
        workspace = "special:scratchpad" 
    }
)'
