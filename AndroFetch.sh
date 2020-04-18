#!/bin/bash
key=$(cat androkey)
sudo az -sd 3978 -n 100 -i minilatest.csv -k $key -o list_apk
mv list_apk/metadata.csv .
