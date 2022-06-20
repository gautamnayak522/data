SELECT * FROM Employees

SELECT EmployeeID,FirstName,LastName,HireDate FROM Employees WHERE DAY(HireDate)=07 OR MONTH(HireDate)=07