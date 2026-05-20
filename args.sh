#! /usr/bin/bash

# args.sh

echo "Esimene argument: $1"
echo "Failinimi:        $0"

for arg in "$@"; do
    echo "Argument: $arg"
done

if [ -d "$1" ]; then            # kui -d ette lisada !, siis oleks eitus
    echo "Kaust olemas $1"
fi

if [ -z "$1" ]; then
    echo "Kasutus: $0 <kaustatee>"
fi

echo "Argumente kokku: $#"