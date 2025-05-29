USE [master]
GO

RESTORE DATABASE [AdventureWorks] 
    FROM DISK = '/adventureworks.bak'
        WITH MOVE 'AdventureWorks2022' TO '/var/opt/mssql/data/AdventureWorks.mdf',
        MOVE 'AdventureWorks2022_log' TO '/var/opt/mssql/data/AdventureWorks_log.ldf'
GO