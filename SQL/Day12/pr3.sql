USE myDB

SELECT * FROM Employees2

ALTER PROC proc_select_emps
WITH ENCRYPTION
AS
SELECT * FROM Employees2


EXECUTE proc_select_emps
EXEC sp_helptext 'proc_select_emps';
