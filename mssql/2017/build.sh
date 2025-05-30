#!/bin/bash
set -e

if [ ! -f adventureworks.bak ]; then
    echo "Downloading AdventureWorks OLTP backup file from Microsoft...";
    wget https://github.com/Microsoft/sql-server-samples/releases/download/adventureworks/AdventureWorks2017.bak -O adventureworks.bak -q;
    echo "Download complete.";
else
    echo "AdventureWorks OLTP backup file already downloaded. Skipping.";
fi
if [ ! -f adventureworks-dw.bak ]; then
    echo "Downloading AdventureWorks data warehouse backup file from Microsoft...";
    wget https://github.com/Microsoft/sql-server-samples/releases/download/adventureworks/AdventureWorksDW2017.bak -O adventureworks-dw.bak -q;
    echo "Download complete.";
else
    echo "AdventureWorks data warehouse backup file already downloaded. Skipping.";
fi
if [ ! -f adventureworks-light.bak ]; then
    echo "Downloading AdventureWorks light backup file from Microsoft...";
    wget https://github.com/Microsoft/sql-server-samples/releases/download/adventureworks/AdventureWorks2017.bak -O adventureworks-light.bak -q;
    echo "Download complete.";
else
    echo "AdventureWorks light backup file already downloaded. Skipping.";
fi
echo "Building OLTP docker image.";
docker build . -t chriseaton/adventureworks:oltp-2017 --build-arg BAK_FILE=./adventureworks.bak;
echo "Building data warehouse docker image.";
docker build . -t chriseaton/adventureworks:datawarehouse-2017 --build-arg BAK_FILE=./adventureworks-dw.bak;
echo "Building light docker image.";
docker build . -t chriseaton/adventureworks:light-2017 --build-arg BAK_FILE=./adventureworks-light.bak;