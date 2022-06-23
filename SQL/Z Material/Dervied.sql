/* DAY 4 TASK*/

-- Create a new database called 'DB_Day_Practice'
USE master
GO
-- Create the new database if it does not exist already
IF NOT EXISTS (
    SELECT name
FROM sys.databases
WHERE name = N'DB_Day_Practice'
)
	CREATE DATABASE DB_Day_Practice
GO

USE DB_Day_Practice;
GO

-- Create a new table called 'Member' in schema 'dbo'
-- Drop the table if it already exists
IF OBJECT_ID('dbo.Member', 'U') IS NOT NULL
DROP TABLE dbo.Member
GO
-- Create the table in the specified schema
CREATE TABLE dbo.Member
(
    Id INT PRIMARY KEY,
    Name VARCHAR(25),
    Point INT
);
GO

-- Insert a Data
INSERT INTO Member
VALUES
    (1, 'Sachin', 978),
    (2, 'Rahul', 773),
    (3, 'Kamplesh', 1141),
    (4, 'Chirag', 773),
    (5, 'Pratik', 1242),
    (6, 'Rajesh', 1141),
    (7, 'Anil', 886)
GO
------------------------------------------------------------

--  display member names in alphabet order with Serial Number like 1, 2, 3, etc.
SELECT *
FROM (
    SELECT ROW_NUMBER() OVER(ORDER BY name) AS 'Sr.No'
    , Name
    FROM dbo.Member
) temp
GO

-- give ranks to the members based on their point and display it in top rank to least rank
SELECT *
FROM (
    SELECT ROW_NUMBER() OVER(ORDER BY Point DESC) AS 'RANK'
        , Point
    FROM dbo.Member
) temp
GO

-- partition by clause with it to divide result with some specified partition.
SELECT *
FROM (
    SELECT ROW_NUMBER() OVER(PARTITION BY Point ORDER BY Point ) AS 'Rank'
        , Name
        , Point
    FROM dbo.Member
) temp
GO

-- How to display member names in rank given by their points? For example highest point will come first and lowest last? 
SELECT *
FROM (
    SELECT RANK() OVER (ORDER BY Point DESC) AS 'RANK'
        , Name
        , Point
    FROM dbo.Member
) temp
GO

-- How to display members who are having second highest? 
SELECT *
FROM (
    SELECT RANK() OVER( ORDER BY Point DESC) AS 'Rank'
    , Name
    , Point
    FROM dbo.Member
) as temp
WHERE
    temp.Rank = 2
GO


-- How to display member names in rank given by their points. For example highest point will come first and lowest last?
SELECT *
FROM ( 
    SELECT DENSE_RANK() OVER( ORDER BY Point DESC) AS 'RANK'
        , Name
        , Point
    FROM dbo.Member
) temp
GO

-- How to display third highest point? 
SELECT *
FROM (
    SELECT DENSE_RANK() OVER( ORDER BY Point DESC) AS 'RANK'
    , Name
    , Point
    FROM dbo.Member
) AS temp
WHERE
    temp.RANK=3
GO

-- How to divide the members in 3 groups by their points? For example so that the highest point will come first and the lowest last into the group?
SELECT *
FROM (
    SELECT NTILE(3) OVER( ORDER BY Point DESC) AS 'RANK'
        , Name
        , Point
    FROM dbo.Member
) temp
GO

/** Aggregate Function **/
-- Drop the table if it already exists
IF OBJECT_ID('dbo.CarSale','U') IS NOT NULL
DROP TABLE dbo.CarSale
GO

-- creates new table called CarSale
Create table dbo.CarSale
(
    Id int primary key identity(1,1) ,
    Model varchar(200),
    Price money
)

Insert into CarSale
values('Baleno', 900000),
    ('M551', 950000),
    ('M551', 950000),
    ('L551', 950000),
    ('L538', 650000),
    ('L538', 900000),
    ('BWW', 8000000),
    ('8530', 450000),
    ('L530', 380000),
    ('L545', 280000)  
GO


-- MAX
SELECT *
FROM (
    SELECT MAX(Price) AS 'MaximumPriceOfModel'
    FROM dbo.CarSale
) temp
GO

-- MIN
SELECT *
FROM (
    SELECT MIN(Price) AS 'MinimumPriceOfModel'
    FROM dbo.CarSale
) temp
GO

-- SUM
SELECT *
FROM (
    SELECT SUM(Price) AS 'SumCostOfModel'
    FROM dbo.CarSale
) temp
GO

-- Count
SELECT *
FROM (
    SELECT COUNT(Model) AS 'NoOfModel'
    FROM dbo.CarSale
) temp
GO

-- AVG
SELECT *
FROM (
    SELECT AVG(Price) AS 'AVGModelPrice'
    FROM dbo.CarSale
) temp 
GO

-- DISTINCT
SELECT *
FROM (
    SELECT DISTINCT(Model)
    FROM dbo.CarSale
) temp 
GO

/* GROUP BY */
USE AdventureWorks2019
GO


WITH GroupCTE
AS(
    SELECT st.[Group] AS 'Territory Group'
        , st.Name AS 'SalesTerritory'
        , SUM(ROUND(soh.TotalDue,2)) AS 'SalesAmt'
    FROM Sales.SalesTerritory AS st
        INNER JOIN Sales.SalesOrderHeader soh
        ON st.TerritoryID = soh.TerritoryID
    GROUP BY st.Name
        , st.[Group]
)
SELECT * FROM GroupCTE
GO

/* HAVING */

WITH HavingCTE
AS(
    SELECT Name AS 'SalesTerritory'
        , SUM(ROUND(soh.TotalDue,2)) AS 'SalesAmt'
    FROM Sales.SalesTerritory AS st
        INNER JOIN Sales.SalesOrderHeader AS soh
        ON soh.TerritoryID = st.TerritoryID
    WHERE 
        st.Name in ('Northwest','Northeast','Southwest','Southeast')
    GROUP BY st.Name
    HAVING SUM(soh.TotalDue) > 8880000
)
SELECT * FROM HavingCTE
GO