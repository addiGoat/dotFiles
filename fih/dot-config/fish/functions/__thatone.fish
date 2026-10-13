function __thatone
    set -l cmd (history search --prefix --max 1 'yay -Ss')
    string replace -- 'yay -Ss' 'yay -S' "$cmd"
end
