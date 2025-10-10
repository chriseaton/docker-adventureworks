FROM mcr.microsoft.com/mssql/server:2022-latest
ARG BAK_FILE
ARG SQL_FILE
ARG MSSQL_SA_PASSWORD
ENV MSSQL_SA_PASSWORD=${MSSQL_SA_PASSWORD}
EXPOSE 1433
WORKDIR /
COPY $BAK_FILE ./adventureworks.bak
COPY $SQL_FILE ./install.sql
COPY ./install.sh .
COPY ./startup.sh .
CMD /bin/bash ./startup.sh