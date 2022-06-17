--Write a SQL statement to change job ID of employee which ID is 118, to SH_CLERK if the employee belongs to department, 
--which ID is 30 and the existing job ID does not start with SH.

SELECT * FROM EMPLOYEES

UPDATE EMPLOYEES
SET JobId='SH_CLERK'
where EmployeeID=118 and JobId NOT LIKE 'SH%' and  DepartmentID=30