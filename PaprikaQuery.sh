#!/bin/bash
java -Xmx2G -XX:+UseConcMarkSweepGC -jar dependencies/Paprika.jar query -db "PaprikaDB/" -d TRUE -r ALLAP -c "PaprikaResults/"
