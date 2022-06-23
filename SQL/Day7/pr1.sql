USE Test2

SELECT * FROM Employees

SELECT * FROM Employees WHERE FirstName = 'SH_EMP'
SELECT * FROM Employees WHERE Salary=72600
SELECT * FROM Employees WHERE Employee_Id=2

SELECT * FROM TestDatas
SP_RENAME TestDatas ,TestDatas1
SP_helptext 'TESTDATAS1'
SP_who


CREATE TABLE Customers
(
	CustomerId int primary key,
	CustomerName varchar(50),
	City varchar(50)
)

INSERT INTO Customers VALUES (1,'AAA','Mumbai'),(2,'BBB','Ahmedabad'),(3,'CCC','Ahmedabad')
SELECT * FROM Customers

CREATE TABLE Suppliers
(
	SupplierId int primary key,
	SupplierName varchar(50),
	City varchar(50)
)

INSERT INTO Suppliers VALUES (1,'MMM','Rajkot'),(2,'NNN','Ahmedabad'),(3,'OOO','Mumbai')
SELECT * FROM Suppliers

--UNION

SELECT City FROM Customers
UNION
SELECT City FROM Suppliers
ORDER BY City;

SELECT City FROM Customers
UNION ALL
SELECT City FROM Suppliers
ORDER BY City;


--MERGE

SELECT * FROM Suppliers

SELECT * INTO Suppliers_s FROM Suppliers

SELECT * FROM Suppliers_s

INSERT INTO Suppliers_s VALUES(4,'PPP','Baroda')
DELETE FROM Suppliers_s WHERE SupplierId=1
UPDATE Suppliers_s
SET SupplierName='nnnnnnnn'
WHERE SupplierId=2;

Select * FROM Suppliers
Select * FROM Suppliers_s

    
MERGE Suppliers AS Target
USING Suppliers_s AS Source
ON Source.SupplierId = Target.SupplierId
 
WHEN NOT MATCHED BY Target THEN
    INSERT (SupplierId,SupplierName, City) 
    VALUES (Source.SupplierId,Source.SupplierName, Source.City)
    
WHEN MATCHED THEN UPDATE SET
    Target.SupplierName	= Source.SupplierName,
    Target.City		= Source.City
    
-- For Deletes
WHEN NOT MATCHED BY Source THEN
    DELETE
;




