FROM postgres:16 AS build
ENV POSTGRES_HOST_AUTH_METHOD=trust
ENV PGDATA=/data
RUN apt-get update \
    && apt-get install wget -y \
    && apt-get install postgresql-16-postgis-3 -y \
    && apt-get install postgis -y
COPY install-a.sql /docker-entrypoint-initdb.d
COPY install-b.sql /docker-entrypoint-initdb.d
COPY install-c.sql /docker-entrypoint-initdb.d
COPY install-d.sql /docker-entrypoint-initdb.d
RUN ["sed", "-i", "s/exec \"$@\"/echo \"skipping...\"/", "/usr/local/bin/docker-entrypoint.sh"]
# RUN ["cat", "/usr/local/bin/docker-entrypoint.sh"]
RUN chmod 775 -R /docker-entrypoint-initdb.d
RUN ["/usr/local/bin/docker-entrypoint.sh", "postgres"]

FROM postgres:16
EXPOSE 5432
RUN apt-get update \
    && apt-get install wget -y \
    && apt-get install postgresql-16-postgis-3 -y \
    && apt-get install postgis -y
COPY --from=build /data /var/lib/postgresql/data
COPY docker-init.sh /usr/local/bin
COPY docker-reconfigure.sh /usr/local/bin
CMD ["docker-init.sh"]