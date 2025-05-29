#!/bin/bash
set -e;

source /usr/local/bin/docker-entrypoint.sh;
docker_setup_env
docker_create_db_directories
export SETUP_PGPASSWORD="${PGPASSWORD:-$POSTGRES_PASSWORD}"
export SETUP_PGUSER="${PGUSER:-$POSTGRES_USER}"
docker_temp_server_start postgres
psql -c "
DO
\$do\$
BEGIN
   IF NOT EXISTS (SELECT FROM pg_roles WHERE rolname = '$SETUP_PGUSER') THEN
      CREATE ROLE $SETUP_PGUSER WITH LOGIN SUPERUSER PASSWORD '$SETUP_PGPASSWORD';
   ELSE
      ALTER USER $SETUP_PGUSER PASSWORD '$SETUP_PGPASSWORD';
   END IF;
END
\$do\$;
"
docker_setup_db
docker_process_init_files /docker-entrypoint-initdb.d/*
docker_temp_server_stop
unset SETUP_PGPASSWORD
unset SETUP_PGUSER