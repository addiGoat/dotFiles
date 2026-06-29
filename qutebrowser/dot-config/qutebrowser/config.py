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
