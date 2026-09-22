function pyinit
    set -f bin_dir ".venv/bin"
    echo heh ur mom "$PWD"
    if test -e "requirements.txt"
        python3 -m venv .venv
        source $bin_dir/activate.fish
        $bin_dir/pip install -r requirements.txt 
        return $status
    else
        echo "No requirements.txt found."
        return 0
    end
end
