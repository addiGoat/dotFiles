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

# Replace ls with eza
alias ls "eza -l --color=auto --group-directories-first --icons"
alias la "eza -la --color=auto --group-directories-first --icons"
alias lsg "eza -lg --color=auto --group-directories-first --icons"
alias lag "eza -lag --color=auto --group-directories-first --icons"
alias lt 'eza -aT --color=auto --group-directories-first --icons --ignore-glob=".git"'

alias grep='grep --color=auto'
