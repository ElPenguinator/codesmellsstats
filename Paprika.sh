#!/bin/bash
INPUT=metadata.csv
filepath=test/
OLDIFS=$IFS
IFS=,
[ ! -f $INPUT ] && { echo "$INPUT file not found"; exit 99; }
first_line=true
while read sha256 pkg_name apk_size dex_date markets
do
	if [ "$first_line" = true ]
	then
		first_line=false
	else
		fn=$filepath$pkg_name.apk
		java -Xmx2G -XX:+UseConcMarkSweepGC -jar dependencies/Paprika.jar analyse -a "/home/dimitri/android-platforms-master" -db "PaprikaDB/" -n "$pkg_name" -p "$pkg_name" -k $sha256 -nd 1000 -r 1.0 -d "$dex_date.000000" -cat Nocat -dev Nodev -s $apk_size -u "unsafe mode" "$fn"
	fi
done < $INPUT
IFS=$OLDIFS
