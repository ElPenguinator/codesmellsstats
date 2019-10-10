#!/bin/bash
mkdir -p Selection
rm -rf Selection/*
for i in {1..5}
do
	filenameapk=$(ls list_apk/ | sort -R | tail -1)
	filename=${filenameapk%".apk"}
	echo $filename " $i"
	mkdir Selection/$filename
	./dex2jar-2.0/d2j-dex2jar.sh -f list_apk/$filenameapk -o Selection/$filename/$filename.jar
	java -jar jd-cli.jar -sr Selection/$filename/$filename.jar
	mv $filename.src.jar Selection/$filename/$filename.src.jar
	cd Selection/$filename/
	jar xf $filename.src.jar	
	cd ../..
	grep -rnw "Selection/$filename/" -e "onLowMemory" >> results_oLM
	grep -rnw "Selection/$filename/" -e "onTrimMemory" >> results_oTM
done
#mkdir Selection/zjimu.main
#./dex2jar-2.0/d2j-dex2jar.sh -f list_apk/zjimu.main.apk -o Selection/zjimu.main/zjimu.main-dex2jar.jar
#java -jar jd-cli.jar Selection/zjimu.main/zjimu.main-dex2jar.jar
#mv zjimu.main-dex2jar.src.jar Selection/zjimu.main/zjimu.main-dex2jar.src.jar
#cd Selection/zjimu.main/
#jar xf zjimu.main-dex2jar.src.jar
#cd ../..

#grep -rnw "." -e "onLowMemory"
#grep -rnw "." -e "onTrimMemory"
