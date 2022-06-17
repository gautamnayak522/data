
--1. Get all employee details from the Employee table 
--2. Get FirstName, LastName from Employees table 
--3. Get FirstName from Employees table using alias name “Employee Name” 
--4. Get employee details from Employees table whose Employee Name is “Steven” 
--5. Get employee details from Employees table whose Employee Name are “Neena” and “Lex” 
--6. Get employee details from Employees table whose Employee name are not “Neena” and “Neena” 
--7. Get employee details from Employees table whose Salary between 5000 and 8000 
--8. Write a query to get the names (FirstName, LastName), Salary, PF of all the Employees (PF is calculated as 12% of salary). 
--9. Get employee details from Employees table whose FirstName starts with ‘N’ 
--10. Write a query to get unique department ID from Employees table 
--11. Write a query to get all employee details from the employee table order by FirstName, descending. 
--12. Write a query to get the EmployeeID, names (FirstName, LastName), salary in ascending order of salary. 
--13.Select TOP 2 salary from employee table



SELECT * FROM Employees

SELECT FirstName,LastName FROM Employees

SELECT FirstName AS EMPLOYEE_NAME FROM Employees

SELECT * FROM Employees WHERE FirstName='Steven'

SELECT * FROM Employees WHERE FirstName='Neena' or FirstName='Lex'
SELECT * FROM Employees WHERE FirstName in('Neena','Lex')

SELECT * FROM Employees WHERE FirstName NOT in('Neena','Lex')

SELECT * FROM EMPLOYEES WHERE Salary BETWEEN 5000 AND 8000

SELECT (FirstName + ''+ LastName) AS NAMES,Salary, PF=Salary*.12 From EMPLOYEES

SELECT * FROM EMPLOYEES WHERE FirstName LIKE 'N%'

SELECT DISTINCT DepartmentID FROM EMPLOYEES;

SELECT * FROM Employees ORDER BY FirstName DESC;

SELECT EmployeeId, (FirstName + ' '+ LastName) AS NAMES,Salary From EMPLOYEES ORDER BY Salary;

SELECT TOP 2 salary FROM Employees;




