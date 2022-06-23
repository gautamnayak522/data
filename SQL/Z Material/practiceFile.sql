-- Drop the database 'dbTemp'
-- Connect to the 'master' database to run this snippet
USE master
GO
-- Uncomment the ALTER DATABASE statement below to set the database to SINGLE_USER mode if the drop database command fails because the database is in use.
-- ALTER DATABASE dbTemp SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
-- Drop the database if it exists
IF EXISTS (
  SELECT name
FROM sys.databases
WHERE name = N'dbTemp'
)
    DROP DATABASE dbTemp
GO

-- Create Database ---
CREATE DATABASE dbTemp
GO
----------------------
USE dbTemp
GO

/*
    Union- combine Query result row and by default it sort and distinct rows from two more table
    Union ALL- combine query result's all rows, even if those duplicate
 */

CREATE TABLE IndianAuthorBook
(
    ID INT PRIMARY KEY,
    Title VARCHAR(100) NOT NULL,
    Author VARCHAR(100) NOT NULL
);
GO

INSERT INTO IndianAuthorBook
VALUES
    (1, 'Saurashtr ni rashdhara', 'Zaverchand Meghani'),
    (2, 'The Story Of My Experiments With The Truth', 'Mahatma Gandhi'),
    (3, 'A Fine Balance', 'Rohinton Mistry')
GO

CREATE TABLE USAuthorBook
(
    ID INT PRIMARY KEY,
    Title VARCHAR(100) NOT NULL,
    Author VARCHAR(100) NOT NULL
);
GO

INSERT INTO USAuthorBook
VALUES
    (1, 'A Random Walk Down Wall Street', 'Burton G. Malkiel'),
    (2, 'Reminiscences of a Stock Operator', 'Edwin Lefevre'),
    (3, 'A Fine Balance', 'Rohinton Mistry')
GO

/***** Union and Union ALL ****/
-- Union ALL
-- only just combine even if there data duplicate
    SELECT *
    FROM IndianAuthorBook
UNION ALL
    SELECT *
    FROM USAuthorBook
GO

-- Union
-- sorted and distinctint data
    SELECT *
    FROM IndianAuthorBook
UNION
    SELECT *
    FROM USAuthorBook
GO

-- target column order matters here, otherwise return unpredicted data
    SELECT ID, Author, Title
    FROM IndianAuthorBook
UNION
    SELECT ID, Title, Author
    FROM USAuthorBook
GO

/* Intersect */
    SELECT ID, Title, Author
    FROM IndianAuthorBook
INTERSECT
    SELECT ID, Title, Author
    FROM USAuthorBook
GO

/* Except */
-- similiar to not in operator also similar to minus 
-- return from LHS query which not matched in RHS Query
    SELECT ID, Title, Author
    FROM IndianAuthorBook
EXCEPT
    SELECT ID, Title, Author
    FROM USAuthorBook
GO

/* Derived Tables */

SELECT Author
FROM (
    SELECT ID, Title, Author
    FROM IndianAuthorBook
) as temp
WHERE ID = 1
GO

/* CTE */
USE AdventureWorks2019
GO

-- A. Creating a simple common table expression
WITH
    Sales_CTE (SalesPersonID, SalesOrderID, SalesYear)
    AS
    (
        SELECT SalesPersonID, SalesOrderID, YEAR(OrderDate) AS SalesYear
        FROM Sales.SalesOrderHeader
        WHERE SalesPersonID IS NOT NULL
    )

SELECT SalesPersonID, COUNT(SalesOrderID) AS TotalSales, SalesYear
FROM Sales_CTE
GROUP BY SalesYear, SalesPersonID
ORDER BY SalesPersonID, SalesYear
GO

-- B. Using a common table expression to limit counts and report averages
WITH
    Sales_CTE (SalesPersonID, NumberOfOrders)
    AS
    (
        SELECT SalesPersonID, COUNT(*)
        FROM Sales.SalesOrderHeader
        WHERE SalesPersonID IS NOT NULL
        GROUP BY SalesPersonID
    )
SELECT AVG(NumberOfOrders) AS "Average Sales Per Person"
    , COUNT(NumberOfOrders) AS "Count Sales Per Person"
FROM Sales_CTE
GO

-- C. Using multiple CTE definitions in a single query
WITH
    Sales_CTE (SalesPersonID, TotalSales, SalesYear)
    AS
    (
        SELECT SalesPersonID, SUM(TotalDue) AS TotalSales, YEAR(OrderDate) AS SalesYear
        FROM Sales.SalesOrderHeader
        WHERE SalesPersonID IS NOT NULL
        GROUP BY SalesPersonID, YEAR(OrderDate)

    )  
,
    -- Use a comma to separate multiple CTE definitions.    
    Sales_Quota_CTE (BusinessEntityID, SalesQuota, SalesQuotaYear)
    AS
    (
        SELECT BusinessEntityID, SUM(SalesQuota)AS SalesQuota, YEAR(QuotaDate) AS SalesQuotaYear
        FROM Sales.SalesPersonQuotaHistory
        GROUP BY BusinessEntityID, YEAR(QuotaDate)
    )

SELECT SalesPersonID  
  , SalesYear  
  , FORMAT(TotalSales,'C','en-us') AS TotalSales  
  , SalesQuotaYear  
  , FORMAT (SalesQuota,'C','en-us') AS SalesQuota  
  , FORMAT (TotalSales -SalesQuota, 'C','en-us') AS Amt_Above_or_Below_Quota
FROM Sales_CTE
    JOIN Sales_Quota_CTE ON Sales_Quota_CTE.BusinessEntityID = Sales_CTE.SalesPersonID
        AND Sales_CTE.SalesYear = Sales_Quota_CTE.SalesQuotaYear
ORDER BY SalesPersonID, SalesYear;