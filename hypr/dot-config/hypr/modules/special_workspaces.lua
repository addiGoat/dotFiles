local util = require("modules.utils")
local mainMod = "ALT"

util.make_special(mainMod, "SHIFT + D", "vesktop", "vesktop", "vesktop")
util.make_special(mainMod, "GRAVE", "kitty", "scratchpad", "kitty --class scratchpad")

