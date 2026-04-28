# general applications
abbr -a e micro
abbr -a c code
# abbr -a z zoxide
abbr -a spot spotify_player
abbr -a hyprconf "micro ~/dotfiles/hypr/hyprland.conf"
abbr -a yay paru
abbr -a matrix "unimatrix -fa -s 95 -c magenta"
abbr -a v nvim

alias fixlock "hyprctl --instance 0 'keyword misc:allow_session_lock_restore 1'; hyprctl --instance 0 'dispatch exec caelestia shell lock lock'"
# git functions
abbr -a ga. "git add ."
abbr -a ga "git add"
abbr -a gp "git push"
abbr -a gpl "git pull"
abbr -a gc "git commit"
abbr -a gcm "git commit -m"
