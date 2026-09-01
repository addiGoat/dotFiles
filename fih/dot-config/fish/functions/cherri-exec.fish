function cherri-exec
    set -f user_current_dir (path resolve (pwd))
    # Directory path starting from the repo root, ie. "repo/system/ddns"
    set -f script_dir (string replace --regex '^/mnt/cherri/' '' "$user_current_dir")

    set -f cherri_mount_dir /mnt/cherri
    if test ! -e "$cherri_mount_dir/repo"
        printf "directory %s does not exist - is it mounted?\n" "$local_repo_dir"
        return 1
    end

    if test -z $argv[1]
        printf "cherri-exec expecting 1 arguments, recieved none"
        return 1
    end

    set -f script_name "$argv[1]"
    set -f script_path "$script_dir/$script_name"

    ssh cherri "test -x $script_path"
    if test $status -ne 0
        echo "File is not executable"
        return 1
    else
        echo "File is executable"
    end

    ssh -t cherri "$script_path"
end
