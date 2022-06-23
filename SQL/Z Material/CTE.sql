USE AdventureWorks2019
GO

-- INNER JOIN 
WITH InnerJoinCTE
AS(
    SELECT pc.Name AS 'Category'
        , ps.Name AS 'SubCategory'
    FROM Production.ProductCategory AS pc
        INNER JOIN Production.ProductSubcategory AS ps
        ON pc.ProductCategoryID =ps.ProductCategoryID
)
SELECT * FROM InnerJoinCTE
GO


-- OUTER JOIN
INSERT INTO Production.ProductCategory
    (Name)
VALUES
    ('Others');
GO


-- FULL OUTER JOIN
WITH FullJoinCTE
AS(
    SELECT pc.Name AS 'Category'
        , ps.Name AS 'SubCategory'
    FROM Production.ProductCategory AS pc
        FULL OUTER JOIN Production.ProductSubcategory AS ps
        ON pc.ProductCategoryID= ps.ProductCategoryID
)
SELECT * FROM FullJoinCTE
GO



-- LEFT OUTER JOIN
WITH LeftJoinCTE
AS(
    SELECT pc.Name AS 'Category'
        , ps.Name AS 'SubCategory'
    FROM Production.ProductCategory AS pc
        LEFT JOIN Production.ProductSubcategory AS ps
        ON pc.ProductCategoryID= ps.ProductCategoryID
)
SELECT * FROM LeftJoinCTE
GO


-- RIGHT OUTER JOIN
WITH RightJoinCTE
AS(
    SELECT pc.Name AS 'Category'
        , ps.Name AS 'SubCategory'
    FROM Production.ProductCategory AS pc
        RIGHT JOIN Production.ProductSubcategory AS ps
        ON pc.ProductCategoryID= ps.ProductCategoryID
)
SELECT * FROM RightjoinCTE
GO


-- SELF JOIN
WITH SelfJoinCTE
AS(
    SELECT lhs.BusinessEntityID AS 'lhs ID'
        , rhs.BusinessEntityID AS 'rhs ID'
    FROM HumanResources.Employee AS lhs
        INNER JOIN HumanResources.Employee AS rhs
        ON lhs.HireDate = rhs.HireDate
            AND lhs.BusinessEntityID < rhs.BusinessEntityID
)
SELECT * FROM SelfjoinCTE
GO


-- CROSS JOIN
WITH CrossJoinCTE
AS(
    SELECT pc.ProductCategoryID AS 'CategoryID'
        , ps.ProductSubcategoryID AS 'SubCategoryID'
    FROM Production.ProductCategory AS pc
        CROSS JOIN Production.ProductSubcategory ps
)
SELECT * FROM CrossjoinCTE
GO