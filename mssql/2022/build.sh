#!/bin/bash
set -e

if [ ! -f adventureworks.bak ]; then
    echo "Downloading AdventureWorks OLTP backup file from Microsoft...";
    wget https://github.com/Microsoft/sql-server-samples/releases/download/adventureworks/AdventureWorks2022.bak -O adventureworks.bak -q;
    echo "Download complete.";
else
    echo "AdventureWorks OLTP backup file already downloaded. Skipping.";
fi
if [ ! -f adventureworks-dw.bak ]; then
    echo "Downloading AdventureWorks data warehouse backup file from Microsoft...";
    wget https://github.com/Microsoft/sql-server-samples/releases/download/adventureworks/AdventureWorksDW2022.bak -O adventureworks-dw.bak -q;
    echo "Download complete.";
else
    echo "AdventureWorks data warehouse backup file already downloaded. Skipping.";
fi
if [ ! -f adventureworks-light.bak ]; then
    echo "Downloading AdventureWorks light backup file from Microsoft...";
    wget https://github.com/Microsoft/sql-server-samples/releases/download/adventureworks/AdventureWorks2022.bak -O adventureworks-light.bak -q;
    echo "Download complete.";
else
    echo "AdventureWorks light backup file already downloaded. Skipping.";
fi
echo "Building OLTP docker image.";
docker build --platform linux/386,linux/amd64,linux/arm,linux/arm64 . -t chriseaton/adventureworks:latest --build-arg BAK_FILE=./adventureworks.bak;
docker tag chriseaton/adventureworks:latest chriseaton/adventureworks:oltp;
docker tag chriseaton/adventureworks:latest chriseaton/adventureworks:oltp-2022;
echo "Building data warehouse docker image.";
docker build --platform linux/386,linux/amd64,linux/arm,linux/arm64 . -t chriseaton/adventureworks:datawarehouse --build-arg BAK_FILE=./adventureworks-dw.bak;
docker tag chriseaton/adventureworks:datawarehouse chriseaton/adventureworks:datawarehouse-2022;
echo "Building light docker image.";
docker build --platform linux/386,linux/amd64,linux/arm,linux/arm64 . -t chriseaton/adventureworks:light --build-arg BAK_FILE=./adventureworks-light.bak;
docker tag chriseaton/adventureworks:light chriseaton/adventureworks:light-2022;