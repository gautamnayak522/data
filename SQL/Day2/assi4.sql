--Write a SQL statement to change the Email column of employees table with ‘not available’ for those employees 
--whose DepartmentID is 80 and gets a commission is less than 20%

SELECT * FROM Employees;

UPDATE Employees
SET Email='Not Available'
where DepartmentID=80 and CommissionPct<20;