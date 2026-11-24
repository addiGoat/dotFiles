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
abbr ng         'nvim +Neogit'
abbr y          'yazi'
abbr jai jacket


# Helpers

abbr -a thatone --position command --function __thatone
abbr :q "exit"
abbr cx "chmod +x"
abbr fixlock    'sudo systemctl restart sddm'
abbr fixportal  'systemctl --user restart xdg-desktop-portal.service'
abbr fixsway "systemctl --user restart swaync.service"
abbr ghrc       'gh repo create --private --source=. --remote=origin --push'
abbr hyprupdate 'hyprpm update --verbose; and hyprpm reload'
abbr kristail   'tail -f ~/Projects/Engines/Kristal/kristal.log'
abbr kristal    '/usr/bin/love /home/addigoat/Projects/Engines/Kristal/'
abbr neofish "cd ~/.config/fish/; and nvim"
abbr neoreal 'neovide -- --listen "$XDG_RUNTIME_DIR/unreal-nvim.sock" & disown'
abbr neovos     'env NVIM_APPNAME=neovos nvim'
abbr nvos       'nvim -u ~/.config/nvim-nvos/init.lua'
abbr ollamacode "ollama launch opencode"
abbr raybuild   'clang++ main.cpp -o main -lraylib'
abbr tailget    'sudo tailscale file get /home/addigoat/Taildrop/'
abbr userctl    'systemctl --user'

## ---- replace/modify builtins ----

# Abbreviate ls to eza function, to hide additional cosmetic flags
abbr ls         'eza'
abbr ll         'eza -l --no-user'

# Color cli output as needed
alias grep     'grep --color=auto'

# Automatically pipe help output through bat
abbr -a --position anywhere -- --help '--help | bat -plhelp'
abbr mesonc "meson compile -C build"
abbr mesoninit "meson setup build"
