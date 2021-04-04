#!/bin/bash

cd /home/alvancho/Documents/IO5/Soal3
current_date=$(date +"%m%d%Y")
unzip -P "$current_date" Koleksi.zip
rm Koleksi.zip
