#!/bin/bash
rm stats.csv
touch stats.csv
folderName=Selection\/
echo Application Name, Have On Low Memory, Have On Trim Memory, Have HashMap, Have SimpleArrayMap >> stats.csv
for pathApp in $folderName/*
do
	appName=${pathApp#"$folderName/"}	
	olm=false
	if test -e "results_nlmr/$appName"; then
		olm=true
	fi
	otm=false
	if test -e "results_nltr/$appName"; then
		otm=true
	fi
	hm=false
	if test -e "results_hmu/hm/$appName"; then
		hm=true
	fi
	sam=false
	if test -e "results_hmu/sam/$appName"; then
		sam=true
	fi
  echo $appName, $olm, $otm, $hm, $sam >> stats.csv
done
