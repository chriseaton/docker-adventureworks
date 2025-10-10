USE [master]
GO

RESTORE DATABASE [AdventureWorks] 
    FROM DISK = '/adventureworks.bak'
        WITH MOVE 'AdventureWorksDW2022' TO '/var/opt/mssql/data/AdventureWorks.mdf',
        MOVE 'AdventureWorksDW2022_log' TO '/var/opt/mssql/data/AdventureWorks_log.ldf'
GO