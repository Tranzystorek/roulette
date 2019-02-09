#!/bin/bash

# can only be run as root
if [[ "$EUID" -ne 0 ]]; then
    echo "You must run this script as root"
    echo "You are not getting away that easily :)"
    exit 0
fi

# to scare the user
trap '' INT
trap '' QUIT

# 1/6 chance to trigger simulated "rm -rfv --no-preserve-root /"
if [[ "$((RANDOM % 6))" -ne 0 ]]; then
    echo "click"
else
    find / -depth \
            -type d -printf "removed directory '%p'\n" \
            -o -printf "removed '%p'\n"
fi
