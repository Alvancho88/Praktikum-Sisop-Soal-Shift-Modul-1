#!/bin/bash

root=/home/alvancho/Documents/IO5/Soal3

current_date=$(date +"%d-%m-%Y")
yesterday_date=$(date -d '-1 day' '+%d-%m-%Y')

date_flag=$(date "+%d")
let date_flag=$date_flag%2

if [ -d "/home/alvancho/Documents/IO5/Soal3/Kelinci_$yesterday_date" ]
then
	download="kitten"
        dirloc="Kucing_$current_date"
	mkdir "$root"/"$dirloc" 
	for ((i=1; i<=23; i=i+1))
    	do
            if [ $i -lt 10 ]
                    then wget -a "$root"/"$dirloc"/Foto.log "https://loremflickr.com/320/240/kitten" -O "$root"/"$dirloc"/Koleksi_0"$i".jpg
            else wget -a "$root"/"$dirloc"/Foto.log "https://loremflickr.com/320/240/kitten" -O "$root"/"$dirloc"/Koleksi_"$i".jpg
            fi
	done
else 
	download="bunny"
        dirloc="Kelinci_$current_date"
	mkdir "$root"/"$dirloc"
	for ((i=1; i<=23; i=i+1))
    	do
            if [ $i -lt 10 ]
                    then wget -a "$root"/"$dirloc"/Foto.log "https://loremflickr.com/320/240/bunny" -O "$root"/"$dirloc"/Koleksi_0"$i".jpg
            else wget -a "$root"/"$dirloc"/Foto.log "https://loremflickr.com/320/240/bunny" -O "$root"/"$dirloc"/Koleksi_"$i".jpg      
            fi
	done
fi

fdupes -dN "$root"/"$dirloc"
cd "$root"/"$dirloc"
counter=1

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
