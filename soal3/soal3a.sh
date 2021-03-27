#! /bin/bash

for ((counter=1; counter<=23; counter=counter+1))
do
	wget -a Foto.log -O Koleksi_$counter  https://loremflickr.com/320/240/kitten
	fdupes -dN /home/alvancho

done
