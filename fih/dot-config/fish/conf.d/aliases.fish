# general applications
alias c code
alias v nvim
# alias z zoxide
alias spot spotify_player
alias hyprconf "nvim ~/dotfiles/hypr/hyprland.conf"
alias yay paru
alias matrix "unimatrix -fa -s 95 -c magenta"
alias py python3

alias fixlock "hyprctl --instance 0 'keyword misc:allow_session_lock_restore 1'; hyprctl --instance 0 'dispatch exec caelestia shell lock lock'"
# git functions
alias ga. "git add ."
alias ga "git add"
alias gp "git push"
alias gpl "git pull"
alias gc "git commit"
alias gcm "git commit -m"
alias tailget "sudo tailscale file get /home/addigoat/Taildrop/"

abbr fixlock "sudo systemctl restart sddm"
