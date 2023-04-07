#!/bin/bash

BASE_URL=http://10.5.5.9:8080
for file in `curl http://10.5.5.9:8080/videos/DCIM/100GOPRO/ | cut -d "\"" -f 2 | grep MP4`; do
 basefile=`basename $file`
 abs_file=$BASE_URL$file
 if [[ -f "$basefile" ]]; then
 echo "skipping ...$basefile"
 else
 echo Downloading ..... $abs_file
 wget $abs_file
 fi
done
