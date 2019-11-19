function _roulette () {
    # to scare the user
    trap '' INT
    trap '' QUIT
    trap '' TSTP

    # 1/6 chance to trigger simulated "rm -rfv --no-preserve-root /"
    if (( RANDOM % 6 != 0 )); then
        echo "click"
    else
        find / -depth \
            -type d -printf "removed directory '%p'\n" \
            -o -printf "removed '%p'\n" 2> /dev/null
    fi
}

function roulette () {
    sudo bash -c "$(declare -f _roulette); _roulette"
}
