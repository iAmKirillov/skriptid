#! /usr/bin/bash

# Puhasta ekraan
clear

echo "Bash versioon: ${BASH_VERSION}"

# Värvide muutujad
RED="\033[0;31m"    # Punane
BLUE="\033[1;34m"   # Sinine rasvane (1 kandilises sulus on rasvane, 0 ei ole)
NC="\033[0m"        # No Color

echo -e "Tere tulemast ${RED}Bash Shell${NC} maailma!"
echo -e "${BLUE}Elu on ilus ${NC}(ja sinine)${BLUE}!${NC}"

# Küsime nii kaua kui saame õige vastuse

while true; do
    read -r -p "Kas jätkame skripti jooksutamist [J/E]?" result # result on muutuja nimi
    case $result in
        [Jj]* ) echo "Jätkame."; break;;
        [Ee]* ) echo "Ei jätka, kahju."; exit;;
        * ) echo "Vali J/j või E/e".;;
    esac
done

echo -e "${BLUE}Õige vastus${NC}"

# Tavaline for-loop

echo # reavahetus
for((x=1; x<11; x++)); do # Alustab ühega, kõik kümne sees, x++ tähendab et kasvab ühe kaupa
    echo -e "Tere ${RED}$x${NC}. korda"
done

# Ootame kasutaja Enter klahvi vajutust

echo # reavahetus
read -r -n 1 -s -p "Jätkamiseks vajuta Enter..."
echo # reavahetus

# Mitte-tavaline for-loop

echo # reavahetus
for x in {0..10} # 0 ja 10 kaasa arvatud
do
    echo -e "Mitte-tavaline tere ${BLUE}$x${NC}. korda."
done

# Paari kaupa

echo # reavahetus
for x in {0..10..2}; do # 0 ja 10 kaasa arvatud
    echo -e "Paari kaupa suurendamine ${BLUE}$x${NC}"
done

# Loeb numbreid tagurpidi
# while-loop 10..0

echo # reavahetus
x=10
while [ $x -gt 0 ]; do
    echo $x
    x=$((x - 1))
done

