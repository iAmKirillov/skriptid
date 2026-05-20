#! /usr/bin/bash

# task_02.sh

### ÜLESANNE ###
# Skript loeb käsurealt laiendi ja loeb kokku eelmise ülesande tulemuse failist (random.txt)
# kõik need laiendid ning näitab tulemuse konsooli.
# Vastuseks ütleb laiendi, mida otsiti ja koguse. 
# Kui ei leitud, siis ütleb, et antud laiendit ei leitud.
### --- ###

random_file="random.txt"

# Kontrolli kas random.txt eksisteerib
if [ ! -f "$random_file" ]; then
    echo "Viga: faili '$random_file' ei leitud!"
    exit 1
fi

    # Loe kokku, mitu korda kõik laiendid esinevad
if [ -z "$1" ]; then
    echo "Kõik laiendid random.txt failist:"
    echo "---"
    sort "$random_file" | uniq -c | sort -rn | while read count ext; do
        echo "$ext: $count"
    done
    echo "---"
    echo "Kokku ridu: $(wc -l < "$random_file")"
    echo # reavahetus
    exit 0
fi

laiend="$1"
 
# Loe kokku kui mitu korda laiend esineb
count=$(grep -c "^${laiend}$" "$random_file")
 
if [ "$count" -eq 0 ]; then
    echo "Laiendit '$laiend' ei leitud."
else
    echo "Laiend: $laiend"
    echo "Kogus: $count"
fi

### ÕPETAJA VARIANT

#EXT="$1"
#SRC="random.txt"
#
#if [ -< "$EXT" ]; then
#    echo "Kasutus: $0 <laiend>"
#    exit 1
#fi
#
#if [ ! -f "$SRC" ]; then
#    echo "$SRC faili ei leitud"
#    exit 1
#fi
#
#total=$(grep -c "$EXT" "$SRC")
#
#if [ "$total" -eq 0 ]; then
#    echo "Laiendit $EXT ei leitud."
#else
#   echo "Laiend $EXT $total tükki."
#fi