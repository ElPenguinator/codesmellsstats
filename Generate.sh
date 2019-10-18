#!/bin/bash
mkdir -p Selection
rm -rf Selection/*
mkdir -p results_olm
mkdir -p results_otm

for i in {1..25}
do
	filenameapk=$(ls list_apk/ | sort -R | tail -1)
	filename=${filenameapk%".apk"}
	echo $filename " $i"
	mkdir Selection/$filename
	./dependencies/dex2jar-2.0/d2j-dex2jar.sh -f list_apk/$filenameapk -o Selection/$filename/$filename.jar
	java -jar dependencies/jd-cli.jar -sr Selection/$filename/$filename.jar
	mv $filename.src.jar Selection/$filename/$filename.src.jar
	cd Selection/$filename/
	jar xf $filename.src.jar	
	cd ../..
	#grep -rnw "Selection/$filename/" -e "onLowMemory" >> results_oLM
	#grep -rnw "Selection/$filename/" -e "onTrimMemory" >> results_oTM
	grep "public[[:space:]]*void[[:space:]]*onTrimMemory\(.*\)" -rnw "Selection/$filename/" | grep -v gms | while read -r line ; do
		mkdir -p results_otm/$filename/
		touch results_otm/$filename/result.txt
		javaPath=$(echo $(pwd)/$line | grep -oP ".*\.java")
		javaFile=$(echo $javaPath | grep -oP "[^\/]*.java")
		javaClass=${javaFile%".java"}
echo "[$javaPath]" >> results_otm/$filename/result.txt
		java -jar dependencies/codesmellsstats.jar $javaPath $javaClass onTrimMemory >> results_otm/$filename/result.txt
	done
	grep "public[[:space:]]*void[[:space:]]*onLowMemory\(.*\)" -rnw "Selection/$filename/" | grep -v gms | while read -r line ; do
		mkdir -p results_olm/$filename/
		touch results_olm/$filename/result.txt
		javaPath=$(echo $(pwd)/$line | grep -oP ".*\.java")
		javaFile=$(echo $javaPath | grep -oP "[^\/]*.java")
		javaClass=${javaFile%".java"}
		echo "[$javaPath]" >> results_olm/$filename/result.txt
		java -jar dependencies/codesmellsstats.jar $javaPath $javaClass onLowMemory >> results_olm/$filename/result.txt
	done
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

#java -jar dependencies/codesmellsstats.jar /home/dimitri/AndroidRuntimeMonitoring/Selection/com.mindletter.lifeup/com/google/android/gms/common/images/ImageManager ImageManager onTrimMemory



