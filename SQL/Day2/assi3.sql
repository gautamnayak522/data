--Write a SQL statement to change the Email and CommissionPct column of employees table with ‘not available’ and 0.10 for 
--those employees whose DepartmentID is 110.

SELECT * FROM Employees

UPDATE Employees
SET Email='Not Available',CommissionPct=0.10 
where DepartmentID=110