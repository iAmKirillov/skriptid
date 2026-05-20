#! /usr/bin/bash

# game.sh

# Arva ära number vahemikus 1-100. Tagauks on 1000
# ÜLESANNE: Mängu lõppedes küsi kasutajalt, kas mängida veel. Kui (jah), reset andmed ja alusta uuesti

reset_game() {
    pc_nr=$((RANDOM % (100-1 + 1) +1))  # Arvuti mõeldud number
    user_nr=0                           # Kasutaja mõeldud number
    counter=0                           # Mitu sammu ära arvamiseks
    game_over=false                     # Kas mäng on läbi

    # TEST
    echo "$pc_nr"
    echo # reavahetus
}

ask() {
    read -r -p "Sisesta number: " user_nr
    counter=$((counter+1))

    if [ "$user_nr" -gt "$pc_nr" ] && [ "$user_nr" -ne 1000 ]; then
        echo "Liiga palju pakud."
    elif [ "$user_nr" -lt "$pc_nr" ] && [ "$user_nr" -ne 1000 ]; then
        echo "Liiga vähe pakud."
    elif [ "$user_nr" -eq "$pc_nr" ] && [ "$user_nr" -ne 1000 ]; then
        echo "Õige vastus!"
        game_over=true
    elif [ "$user_nr" -eq 1000 ]; then
        echo "Leidsid tagaukse. Number on $pc_nr."
        game_over=true
    fi
}

lets_play() {
    while [ "$game_over" = false ]; do
        ask
    done
    # Mäng läbi
    echo # reavahetus
    echo "Arvasid õigesti $counter korraga."
    echo # reavahetus
}

while true; do
    reset_game
    lets_play

    read -r -p "Kas soovid uuesti mängida? (jah/ei): " vastus
    if [ "$vastus" != "jah" ] && [ "$vastus" != "j" ]; then
        echo "Nägemist!"
        break
    fi
    echo
done

