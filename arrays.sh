#! /usr/bin/bash

# arrays.sh

names=("Kallaste" "Kristjan" "Kristiano") # massiiv kolme elemendiga

echo "Esimene nimi: ${names[0]}"

echo # reavahetus

for name in "${names[@]}"; do
    echo "$name"
done

# Tagurpidi ka

echo # reavahetus
for((x=${#names[@]}-1; x>=0; x--)); do
    echo "${names[x]}"
done

echo # reavahetus