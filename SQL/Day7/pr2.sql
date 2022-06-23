SELECT * FROM Suppliers
SELECT * FROM Suppliers_s


--INSERT INTO Suppliers VALUES(6,'QQQ','Baroda')

SELECT SupplierID FROM Suppliers
UNION
SELECT SupplierID FROM Suppliers_s


SELECT SupplierID FROM Suppliers
EXCEPT
SELECT SupplierID FROM Suppliers_s

SELECT SupplierID FROM Suppliers
INTERSECT
SELECT SupplierID FROM Suppliers_s


---Derived Tables

SELECT SupplierName FROM (
SELECT SupplierId,SupplierName FROM Suppliers WHERE City = 'Baroda'
) myderivedtable



