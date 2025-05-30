![Robot Carrying Boxes](.repo.jpg)
# Docker AdventureWorks
Now you can quickly spin up the *AdventureWorks* sample database in **docker**!

These databases are built off the available backups provided by Microsoft, and a custom port to *postgres*.
The docker images utilize the native images provided for Microsoft SQL Server, and Postgres.

This project is available on...
- Docker Hub: [`chriseaton/adventureworks`](https://hub.docker.com/r/chriseaton/adventureworks)
- GitHub: [`chriseaton/docker-adventureworks`](https://github.com/chriseaton/docker-adventureworks)

To run one of the samples, see §Running below.    
You can find samples of a `docker` or `docker-compose.yaml` files in the `samples/` directory.

## Quick Start

To get started, you just need to fire off your `docker` command which will pull and run the database image. Check out the `samples/` directory for more.

> [!TIP]
> Replace `My_password1` with your own secure password. Note that the password *must* pass minimum complexity requirements
or you won't be able to connect!

### Microsoft SQL Server
This docker image uses the same environmental variables defined on the [Microsoft SQL Server docker image](https://hub.docker.com/_/microsoft-mssql-server).
```
docker run -p 1433:1433 \
 -e 'ACCEPT_EULA=Y' \
 -e 'MSSQL_SA_PASSWORD=My_password1' \
 -d chriseaton/adventureworks:latest
```

### Postgres
This docker image uses the same environmental variables defined on the [Postgres docker image](https://hub.docker.com/_/postgres).
```
docker run -p 5432:5432 \
 -e 'POSTGRES_PASSWORD=My_password1' \
 -d chriseaton/adventureworks:postgres
```

## Tags
Currently this docker image is available in two supported database engines: Microsoft SQL Server & Postgres

To ensure parity and cross-compatibility, we use a slightly older version of each.

- Microsoft SQL 2022 & 2017
- Postgres 16 & 13

If you'd like to leverage a specific version, you can clone this repository and modify the `build.sh` scripts in the 
appropriate folder.

### Microsoft SQL Server
There are three versions tagged for Microsoft SQL Server:

| Tag | Description |
|-----|-------------|
| `latest` or `oltp` or `oltp-2022` | This image contains the standard OLTP version of the AdventureWorks database on Microsoft SQL 2022. |
| `oltp-2017` | This image contains the standard OLTP version of the AdventureWorks database on Microsoft SQL 2017. |
| `datawarehouse` or `datawarehouse-2022` | This image utilizes the data warehouse version of the AdventureWorks database on Microsoft SQL 2022. |
| `datawarehouse-2017` | This image utilizes the data warehouse version of the AdventureWorks database on Microsoft SQL 2017. |
| `light` or `light-2022` | This image utilizes the "light" version of the AdventureWorks database on Microsoft SQL 2022. |
| `light-2017` | This image utilizes the "light" version of the AdventureWorks database on Microsoft SQL 2017. |

### Postgres
At this time, only the tables and data are fully implemented but should be accurately converted to postgres data types (including geography).
Some views (specifically, the ones using XML and `CROSS APPLY`) have been omitted.

No functions, custom types, or stored procedures are included.

| Tag | Description |
|-----|-------------|
| `postgres` or `postgres-16` | This image adapts the "light" version of the AdventureWorks database to Postgres 16.  |
| `postgres-13` | This image adapts the "light" version of the AdventureWorks database to Postgres 13.  |

## Development

### Building
Run the `build.sh` script to download the AdventureWorks [backup file from Microsoft](https://docs.microsoft.com/en-us/sql/samples/adventureworks-install-configure), and to build and tag the docker image.

### Publishing
If you are a maintainer, you can publish the image to docker hub [chriseaton/adventureworks](https://hub.docker.com/repository/docker/chriseaton/adventureworks).

```sh
docker push chriseaton/adventureworks
```

