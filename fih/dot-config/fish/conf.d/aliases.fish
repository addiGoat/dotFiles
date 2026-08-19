# necessary
alias yay paru

# general applications
abbr v nvim
abbr lg lazygit
abbr y yazi
abbr py python3
abbr pyenv "source .venv/bin/activate.fish"

# Helpers
abbr tailget "sudo tailscale file get /home/addigoat/Taildrop/"
abbr fixlock "sudo systemctl restart sddm"
abbr hyprupdate "hyprpm update --verbose; and hyprpm reload"

alias grep='grep --color=auto'

abbr kristal '/usr/bin/love /home/addigoat/Projects/Engines/Kristal/'
abbr kristail tail -f ~/Projects/Engines/Kristal/kristal.log

# Config Shortcut

abbr hyprconf 'nvim ~/.config/hypr/'

## ---- replace builtins ----

# ls with eza
alias ls "eza -l --color=auto --group-directories-first --icons=auto"
alias la "eza -la --color=auto --group-directories-first --icons=auto"
alias lsg "eza -lg --color=auto --group-directories-first --icons=auto"
alias lag "eza -lag --color=auto --group-directories-first --icons=auto"
alias lt 'eza -aT --color=auto --group-directories-first --icons=auto --ignore-glob=".git|.venv"'

# cat with bat

abbr b bat
