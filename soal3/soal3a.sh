#!/bin/bash

dirloc=/home/alvancho/Documents/IO5/Soal3

if [ -f $dirloc/Foto.log ]
then
	rm $dirloc/Foto.log
fi

for ((counter=1; counter<=23; counter=counter+1))
    do
    if [ $counter -lt 10 ]
        then wget -a "$dirloc"/Foto.log "https://loremflickr.com/320/240/kitten" -O "$dirloc"/Koleksi_0"$counter".jpg
    else wget -a "$dirloc"/Foto.log "https://loremflickr.com/320/240/kitten" -O "$dirloc"/Koleksi_"$counter".jpg
    fi
done


counter=1
cd "$dirloc"
fdupes -dN "$dirloc"

for f in Koleksi_*.jpg
    do
    if [ $counter -lt 10 ]
        then 
            mv -- "$f" "Koleksi_0$counter.jpg"
    else 
        mv -- "$f" "Koleksi_$counter.jpg"
    fi
let counter=$counter+1
done
