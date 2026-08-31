# necessary
alias yay paru

# general applications
abbr v nvim
abbr lg lazygit
abbr y yazi
abbr py python3
abbr pyenv "source .venv/bin/activate.fish"
abbr ssh "kitten ssh"
abbr b bat

# Helpers
abbr tailget "sudo tailscale file get /home/addigoat/Taildrop/"
abbr fixlock "sudo systemctl restart sddm"
abbr hyprupdate "hyprpm update --verbose; and hyprpm reload"
abbr userctl "systemctl --user"

alias grep='grep --color=auto'

abbr kristal '/usr/bin/love /home/addigoat/Projects/Engines/Kristal/'
abbr kristail tail -f ~/Projects/Engines/Kristal/kristal.log

# Config Shortcut

abbr hyprconf 'nvim ~/.config/hypr/'

## ---- replace builtins ----

# ls with eza
alias ls "eza --color=auto --group-directories-first --icons=auto"
alias ll "eza -l --no-user --color=auto --group-directories-first --icons=auto"

