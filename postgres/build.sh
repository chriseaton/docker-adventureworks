#!/bin/bash
set -e

if [ ! -f adventureworks.zip ]; then
    echo "Downloading postgres AdventureWorks zip file from github.com/chriseaton/docker-adventureworks";
    wget "https://github.com/chriseaton/docker-adventureworks/releases/download/2025-05-29/chriseaton-docker-adventureworks-postgres.zip" -O adventureworks.zip -q;
    echo "Download complete."
else
    echo "postgres AdventureWorks file already downloaded. Skipping.";
fi
echo "Unzipping postgres AdventureWorks zip file.";
# unzip adventureworks.zip;
# rm adventureworks.zip;
echo "Building postgres docker image.";
if [[ -f install-a.sql ]] && [[ -f install-a.sql ]] && [[ -f install-a.sql ]] && [[ -f install-a.sql ]]; then
    docker build --platform linux/386,linux/amd64,linux/arm,linux/arm64 --progress=plain . -t chriseaton/adventureworks:postgres -t chriseaton/adventureworks:postgres-16;
else
    echo "Required SQL files not found. Please ensure install-a.sql, install-b.sql, install-c.sql, and install-d.sql are present.";
    exit 1;
fi
echo 0;