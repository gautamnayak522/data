SELECT * FROM Employees
SELECT FirstName,HireDate, DATEDIFF(Year,HireDate,GETDATE()) AS 'Experience of Years' FROM Employees