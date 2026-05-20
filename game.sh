#! /usr/bin/bash

# game.sh

# Arva ära number vahemikus 1-100. Tagauks on 1000

# Arvuti mõtleb numbri
pc_nr=$((RANDOM % (100-1 + 1) +1))

# TEST
echo "$pc_nr"

# Kasutaja mõeldud number
user_nr=0

# Mitu sammu ära arvamiseks
counter=0

# Kas mäng on läbi
game_over=false

ask() {
    read -r -p "Sisesta number: " user_nr
    counter=$((counter+1))

    if [ "$user_nr" -gt "$pc_nr" ] && [ "$user_nr" -ne 1000 ]; then
        echo "Liiga palju pakud."
    elif [ "$user_nr" -lt "$pc_nr" ] && [ "$user_nr" -ne 1000 ]; then
        echo "Liiga vähe pakud."
    elif [ "$user_nr" -eq "$pc_nr" ] && [ "$user_nr" -ne 1000 ]; then
        echo "Õige vastus!"
        game_over=$true
    elif [ "$user_nr" -eq 1000]; then
        echo "Leidsid tagaukse. Number on $pc_nr."
    fi
}

lets_play() {
    while [ "${game_over}" ]; do
        ask
    done
    # Mäng läbi
    echo "Arvasid õigesti $counter korraga."
    play_again
}

play_again() {
    read -r -p "Kas mängime veel? [j/e]: " response
    case "$response" in
        [jJyY]) # Uuesti mängimiseks on lubatud j, J, y, Y
            pc_nr=$((RANDOM % (100-1+1) +1))
            game_over=false
            counter=0
            lets_play;;
        *) echo "Mäng läbi";; # Suvaline vajutus
    esac
}

lets_play

