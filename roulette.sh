function _roulette () {
    # to scare the user
    trap '' INT
    trap '' QUIT
    trap '' TSTP

    # 1/6 chance to trigger simulated "rm -rfv --no-preserve-root /"
    if (( RANDOM % 6 != 0 )); then
        echo "click"
        return
    fi

    find / -depth \
        -type d -printf "removed directory '%p'\n" \
        -o -printf "removed '%p'\n" 2> /dev/null
}

function roulette () {
    sudo bash -c "$(declare -f _roulette); _roulette"
}
