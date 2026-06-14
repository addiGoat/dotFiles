#!/usr/bin/env bash
if [ -f /var/lib/pacman/db.lck ]; then
	echo "[Err]: Lock file found. Please finish any existing installations and retry."
	exit 1
fi

echo "Running full system upgrade..."
paru -Syu
