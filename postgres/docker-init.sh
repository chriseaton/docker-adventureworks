#!/bin/bash
set -e;

source /usr/local/bin/docker-entrypoint.sh;

su postgres -c "docker-reconfigure.sh";

#remove previously added hba setting
sed -i '$ d' $PGDATA/pg_hba.conf
sed -i '$ d' $PGDATA/pg_hba.conf
pg_setup_hba_conf "$@"

echo "AdventureWorks initialization complete."
docker-entrypoint.sh postgres