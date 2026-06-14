#!/usr/bin/env bash
export SDL_VIDEODRIVER=x11
export __GL_THREADED_OPTIMIZATIONS=1
exec "$HOME/UE_5.7.4/Engine/Binaries/Linux/UnrealEditor" "$@"
