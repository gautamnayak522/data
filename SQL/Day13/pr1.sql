--UDF

SELECT * FROM Employees2

ALTER FUNCTION COUNTTOTALSALARY (@id int)
RETURNS int
AS

BEGIN
	DECLARE @ret int;
	SET @ret = @id+500
	RETURN @ret
END

SELECT First_Name,Salary,dbo.COUNTTOTALSALARY(Salary) AS 'UPDATED SALARY' FROM Employees2

-------------

CREATE FUNCTION GET_Employee(@id INT)
RETURNS VARCHAR(50)
AS
BEGIN
	RETURN (SELECT First_Name FROM Employees2 WHERE Employee_Id=@id)
END

PRINT dbo.GET_Employee(1)


----------------

CREATE FUNCTION GET_Employees()
RETURNS TABLE
AS
	RETURN 
	SELECT * FROM Employees2

DROP FUNCTION GET_Employees

SELECT * FROM dbo.GET_Employees()











