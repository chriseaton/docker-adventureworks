USE [master]
GO

RESTORE DATABASE [AdventureWorks] 
    FROM DISK = '/adventureworks.bak'
        WITH MOVE 'AdventureWorks2017' TO '/var/opt/mssql/data/AdventureWorks.mdf',
        MOVE 'AdventureWorks2017_log' TO '/var/opt/mssql/data/AdventureWorks_log.ldf'
GO