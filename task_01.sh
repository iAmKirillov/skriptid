#! /usr/bin/bash

# task_01.sh

### ÜLESANNE ###
# Tee uus skript nimega task_01.sh. Argumente käsureal ei ole!
# Loe laiendite faili (failinimi on skriptis, mitte käsureal!)
# Faili olemasolu tuleb kontrollida!
# Võta üks juhuslik laiend failist ja LISA uude faili nimega random.txt
# Iga kord kui skript käivitatakse, lisatakse faili üks uus laiend uuele reale!
# Käivitades skripti näiteks 100 korda, siis on random.txt failis 100 rida ja suvalised laiendid

# Kui skript töötab, proovi käsurealt (automaatselt) käivitada 100 korda!
### --- ###

file_name="extensions.txt"
 
# Kontrolli kas fail eksisteerib
if [ ! -f "$file_name" ]; then  # hüüumärk tähendab eitust!
    echo "Viga: faili '$file_name' ei leitud!"
    exit 1
fi
 
# Loe laiendid massiivi
extensions=()
while IFS='' read -r line; do
    if [ ! -z "$line" ]; then
        extensions+=("$line")
    fi
done < "$file_name"
 
# Võta juhuslik laiend
random_ext=${extensions[$RANDOM % ${#extensions[@]}]}
 
# Lisa random.txt faili uuele reale
echo "$random_ext" >> random.txt
 
echo "Lisatud: $random_ext"


### ÕPETAJA VARIANT ###
#SRC="extensions.txt"
#DEST="random.txt"
#
#if [ -f "$SRC" ]; then
#    ext=#(shuf -n 1  "$SRC")
#    echo "$ext >> "$DEST"
#fi

# for x in {1..100}; do ./task_01.sh; done
