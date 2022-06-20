SELECT * FROM Employees

SELECT FirstName,LEN(FirstName) AS Length_of_FirstName FROM Employees WHERE LastName LIKE '__c%'