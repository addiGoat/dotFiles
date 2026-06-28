#!/usr/bin/env bash 

program=$(pgrep pavucontrol)
echo $program

if [ -z $program ]; then
    echo "program not found"
    /usr/bin/pavucontrol -t 1 &
else
    echo "program found"
    kill $program
fi    
