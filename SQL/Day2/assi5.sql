--Write a SQL statement to change the Email column of employees table with ‘not available’ for those 
--employees who belongs to the ‘Accouning’ department

SELECT * FROM Employees

UPDATE Employees
SET Email='Not Available'
where DepartmentID=90;