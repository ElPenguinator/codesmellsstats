#!/bin/bash
#rm res_aDoctor/test_NLMR.csv
#touch res_aDoctor/test_NLMR.csv
#java -cp dependencies/aDoctor-1.0.jar it.unisa.aDoctor.process.RunAndroidSmellDetection /home/dimitri/AndroidRuntimeMonitoring/Selection/com.eskibars.sparki/ res_aDoctor/test_NLMR.csv 000000000010000

#rm res_aDoctor/test_RAM.csv
#touch res_aDoctor/test_RAM.csv
#java -cp dependencies/aDoctor-1.0.jar it.unisa.aDoctor.process.RunAndroidSmellDetection /home/dimitri/AndroidRuntimeMonitoring/Selection/com.appybuilder.tariktubeyou2017.CARID/com/ res_aDoctor/test_RAM.csv 000000000000100

#rm res_aDoctor/test_DW.csv
#touch res_aDoctor/test_DW.csv
#java -cp dependencies/aDoctor-1.0.jar it.unisa.aDoctor.process.RunAndroidSmellDetection /home/dimitri/AndroidRuntimeMonitoring/Selection/com.appybuilder.tariktubeyou2017.CARID/com/ res_aDoctor/test_DW.csv 001000000000000

#rm res_aDoctor/test_LT.csv
#touch res_aDoctor/test_LT.csv
#java -cp dependencies/aDoctor-1.0.jar it.unisa.aDoctor.process.RunAndroidSmellDetection /home/dimitri/AndroidRuntimeMonitoring/Selection/com.appybuilder.tariktubeyou2017.CARID/com/ res_aDoctor/test_LT.csv 000000001000000


#!/bin/bash
mkdir -p results_aDoctor_NLMR
mkdir -p results_aDoctor_RAM
mkdir -p results_aDoctor_DW
mkdir -p results_aDoctor_LT

rm -rf results_aDoctor_NLMR/*
rm -rf results_aDoctor_RAM/*
rm -rf results_aDoctor_DW/*
rm -rf results_aDoctor_LT/*

APPS="Selection/*/"

for appFolder in $APPS
do
	filenameapk=${appFolder#"Selection/"}
	echo $appFolder
	#filenameapk=$(ls list_apk/ | sort -R | tail -1)
	filename=${filenameapk%"/"}
	echo $filename
	mkdir -p results_aDoctor_NLMR/$filename/
	touch results_aDoctor_NLMR/$filename/results.csv
	java -cp dependencies/aDoctor-1.0.jar it.unisa.aDoctor.process.RunAndroidSmellDetection $appFolder results_aDoctor_NLMR/$filename/results.csv 000000000010000

	mkdir -p results_aDoctor_RAM/$filename/
	touch results_aDoctor_RAM/$filename/results.csv
	java -cp dependencies/aDoctor-1.0.jar it.unisa.aDoctor.process.RunAndroidSmellDetection $appFolder results_aDoctor_RAM/$filename/results.csv 000000000000100

	mkdir -p results_aDoctor_DW/$filename/
	touch results_aDoctor_DW/$filename/results.csv
	java -cp dependencies/aDoctor-1.0.jar it.unisa.aDoctor.process.RunAndroidSmellDetection $appFolder results_aDoctor_DW/$filename/results.csv 001000000000000

	mkdir -p results_aDoctor_LT/$filename/
	touch results_aDoctor_LT/$filename/results.csv
	java -cp dependencies/aDoctor-1.0.jar it.unisa.aDoctor.process.RunAndroidSmellDetection $appFolder results_aDoctor_LT/$filename/results.csv 000000001000000

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




