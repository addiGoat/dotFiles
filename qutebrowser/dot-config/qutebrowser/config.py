# pyright: reportUndefinedVariable=false
import os
from urllib.request import urlopen


config.load_autoconfig(False)

if not os.path.exists(config.configdir / "theme.py"):
    theme = "https://raw.githubusercontent.com/catppuccin/qutebrowser/main/setup.py"
    with urlopen(theme) as themehtml:
        with open(config.configdir / "theme.py", "a") as file:
            file.writelines(themehtml.read().decode("utf-8"))

if os.path.exists(config.configdir / "theme.py"):
    import theme
    theme.setup(c, 'macchiato', True)

config.bind('J', 'tab-prev', mode='normal')
config.bind('K', 'tab-next', mode='normal')


c.fonts.default_size = "14pt"
c.fonts.default_family = "JetBrainsMono Nerd Font"

c.colors.webpage.darkmode.enabled = True
c.tabs.padding = { "bottom": 5, "top": 5, "left": 5, "right": 5 }
