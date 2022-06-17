--Write a SQL statement to change the Email and CommissionPct column of employees table with ‘not available’ and 0.10 for all employees.
SELECT * FROM Employees

UPDATE Employees
SET Email='Not Available',CommissionPct=0.10;