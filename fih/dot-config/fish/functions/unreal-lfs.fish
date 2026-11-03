function unreal-lfs --description "Initialize Git LFS for Unreal Engine"
    set -l template "$__fish_config_dir/templates/gitignore-unreal"

    if not git rev-parse --show-toplevel >/dev/null 2>&1
        git init; or return 1
    end

    git lfs install --local; or return 1

    git lfs track "*.uasset"
    git lfs track "*.umap"

    git add .gitattributes

    cp "$template" .gitignore; or echo ".gitignore template failed to copy, please create it before making a commit"

    echo "Git LFS initialized"
end
