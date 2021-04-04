#!/bin/bash

dirloc=/home/alvancho/Documents/IO5/Soal3

download_date=$(date +"%d-%m-%Y")
mkdir "$download_date"

bash $dirloc/soal3a.sh

mv $dirloc/Foto.log "$dirloc/$download_date/"
mv $dirloc/Koleksi_* "$dirloc/$download_date/"
