function emake --description "Open a Makefile in micro"
    set -l target_dir
    set -l is_default 0

    if test (count $argv) -gt 1
        echo "Usage: emake [directory]"
        return 1
    end

    if test (count $argv) -eq 1
        set target_dir $argv[1]
    else
        set target_dir .
        set is_default 1
    end

    if not test -d "$target_dir"
        echo "emake: directory not found: $target_dir"
        return 1
    end

    set -l makefile_path "$target_dir/Makefile"

    if not test -f "$makefile_path"
        if test $is_default -eq 1
            echo "emake: no Makefile found in current directory"
        else
            echo "emake: no Makefile found in $target_dir"
        end
        return 1
    end

    micro "$makefile_path"
end
