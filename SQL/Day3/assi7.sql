SELECT * FROM Employees
SELECT YEAR(GETDATE())

DECLARE @dob Date
SET @dob='2001-08-04'
SELECT DATEDIFF(YY,@dob,GETDATE())