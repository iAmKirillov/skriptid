#! /usr/bin/bash

# read_from_file.sh

file_name="$1"

#if [ -z "$1" ]; then
#    echo "Viga: failinimi puudub!"
#    echo "Kasutus: ./read_from_file.sh extensions.txt"
#    exit 1
#fi

if [ -f "$file_name" ]; then # -f kontrollib kas fail on olemas
    # echo "Fail olemas"
    extensions=() # Tühi massiiv
    while IFS='' read -r line; do
        if [ ! -z "$line" ]; then         # Kui rida pole tühi,
            extensions+=("$line")         # siis kirjuta massiivi
        fi
    done < "$file_name"                   # Loe faili sisu

    echo "Laiendeid kokku: ${#extensions[@]}"

    # ÜLESANNE: Väljasta kõik leitud laiendid ühel real kujul: png, jpg, txt...
    ### Variant 1 
    # result=$(IFS=', '; echo "${extensions[*]}")
    # echo "Laiendid: $result"

    # TÜHIKUTE LISAMINE

    result=""
for ext in "${extensions[@]}"; do
    if [ -z "$result" ]; then
        result="$ext"
    else
        result="$result, $ext"
    fi
done
echo # reavahetus
echo "Laiendid: $result"

    ### Variant 3
    #printf "%s, " "${extensions[@]:0:${#extensions[@]}-1}"
    #echo "${extensions[-1]}"

    # ÜLESANNE 2: Väljasta üks juhuslik kaiend massiivist extensions
    random_ext=${extensions[$RANDOM % ${#extensions[@]}]}
    echo "Juhuslik laiend: $random_ext"
echo # reavahetus

    # ÜLESANNE 3: Täienda skripti nii, et kui argumenti pole, öeldakse: failinimi.sh extensions.txt 
    # Üks variant on TÄITSA ÜLEVAL, file_name="$1" rea all
    # Teine variant, lihtsam on:
else
    echo "Laiendite fail on puudu!"
    echo "Kasuta: $0 extensions.txt"
fi