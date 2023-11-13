#!/bin/bash

echo "Running installation script..."

#wait for the SQL Server to come up
sleep 30s

#run the setup script to create the DB and the schema in the DB
/opt/mssql-tools/bin/sqlcmd -S localhost -U sa -P "$SA_PASSWORD" -d master -i install.sql
echo
echo "Done installing database."
echo "Server is ready."
sleep infinity