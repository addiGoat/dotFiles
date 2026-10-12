local env = require("modules.env")

-- GLOBAL VARIABLES --
MainMod = "ALT"

Terminal = "kitty"
Launcher = "rofi -show drun"

MonitorOne = "DP-1"
MonitorTwo = "HDMI-A-1"

if env.is_laptop then
    MonitorOne = "eDP-1"
end

-- System config
require("modules.startup")
require("modules.general_appearance")
require("modules.monitors")
require("modules.input")

require("modules.binds")
require("modules.submaps")
require("modules.rofi")

require("modules.window_rules.init")
require("modules.special_workspaces")

-- horrible horrible idea
-- require("plugins.foxyd")

require("plugins.dynamic-cursors")

-- HyprMod managed settings
require("hyprland-gui")
