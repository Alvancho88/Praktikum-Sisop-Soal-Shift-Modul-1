#!/bin/bash

cd /home/alvancho/Documents/IO5/Soal3
download_date=$(date +"%m%d%Y")
zip -rem -P "$download_date" Koleksi.zip Kelinci_* Kucing_*
