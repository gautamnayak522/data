USE myDB

SELECT * FROM Employees2

CREATE PROCEDURE PRC1
AS
BEGIN
	SELECT * FROM Employees2
END

PRC1 3

ALTER PROCEDURE PRC1 @id int
AS
BEGIN
	SELECT * FROM Employees2 WHERE Employee_Id=@id
END

EXEC PRC1 3

-----------------------------


ALTER PROCEDURE COUNTDEPARTMENT @Department varchar(50),@count int output
AS
BEGIN
	SET @count = (SELECT COUNT(*) FROM Employees2 WHERE Department=@Department)
END


DECLARE @count int;
EXECUTE COUNTDEPARTMENT 'Banking', @count output
PRINT @count