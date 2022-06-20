SELECT * FROM Employees

SELECT DISTINCT HireDate as 'List of Mondays' from Employees WHERE DATENAME(weekday,HireDate)='Monday'

SELECT DATENAME(weekday,'1987-06-22')