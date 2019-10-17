#!/bin/bash
cd dependencies

curl --silent "https://api.github.com/repos/ElPenguinator/JavaCodeRetriever/releases/tags/v1.0" \
| grep "browser_download_url.*jar" \
| cut -d '"' -f 4 \
| wget -qi -
