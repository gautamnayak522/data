xUSE myDB

SELECT * FROM Employees2

ALTER PROCEDURE UpdateSalaryEMP2 
AS   
BEGIN
	SET NOCOUNT ON;
	SELECT * FROM Employees2 WHERE Department='Banking'

END
   
	

DECLARE @return int
EXECUTE @return = UpdateSalaryEMP2
PRINT @return

IF @return =0
	PRINT 'DATA FETCHED'
ELSE
	PRINT 'ERROR'

EXEC sp_rename 'UpdateSalaryEMP2','BankingEmps'

EXECUTE BankingEmps

