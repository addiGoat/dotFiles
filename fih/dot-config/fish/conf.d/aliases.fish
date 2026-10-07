# necessary
alias yay paru

# general applications
abbr b          'bat'
abbr cheat      'curl cht.sh'
abbr lg         'lazygit'
abbr py         'python3'
abbr pyenv      'source .venv/bin/activate.fish'
abbr ssh        'kitten ssh'
abbr stow       'stow --dotfiles'
abbr v          'nvim'
abbr y          'yazi'

# Helpers
abbr fixlock    'sudo systemctl restart sddm'
abbr ghrc       'gh repo create --private --source=. --remote=origin --push'
abbr hyprupdate 'hyprpm update --verbose; and hyprpm reload'
abbr raybuild   'clang++ main.cpp -o main -lraylib'
abbr tailget    'sudo tailscale file get /home/addigoat/Taildrop/'
abbr userctl    'systemctl --user'
abbr fixportal  'systemctl --user restart xdg-desktop-portal.service'
abbr neovos     'env NVIM_APPNAME=neovos nvim'
abbr nvos       'nvim -u ~/.config/nvim-nvos/init.lua'

abbr kristal    '/usr/bin/love /home/addigoat/Projects/Engines/Kristal/'
abbr kristail   'tail -f ~/Projects/Engines/Kristal/kristal.log'

## ---- replace/modify builtins ----

# Abbreviate ls to eza function, to hide additional cosmetic flags
abbr ls         'eza'
abbr ll         'eza -l --no-user'

# Color cli output as needed
alias grep=     'grep --color=auto'


