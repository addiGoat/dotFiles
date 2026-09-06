#!/usr/bin/env fish

set -l yarg_path ~/Games/YARG

gamescope \
    -W 2560 -H 1440 \
    -w 2560 -h 1440 \
    -r 165 \
    -f \
    --force-grab-cursor \
    -- $yarg_path
