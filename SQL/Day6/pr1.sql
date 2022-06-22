--SUB QUERIES
USE MyDB

SELECT * FROM Employees
SELECT FirstName,Salary FROM Employees WHERE Department IN(SELECT Department FROM Employees WHERE Salary>750000)


-->  find name of Employee whose salary is more than Philip Salary in Emp Table

SELECT * FROM Employees

--using subquiries

SELECT FirstName,Salary FROM Employees WHERE Salary >(SELECT SALARY FROM Employees WHERE FirstName='Philip')

--using joins

SELECT e1.FirstName,e1.Salary,e2.salary 
FROM Employees e1 JOIN Employees e2
ON e1.Employee_Id=e2.Employee_Id
WHERE e2.Salary>(SELECT SALARY FROM Employees WHERE FirstName='Philip' )

--Nested Subquiries
SELECT * FROM Employees

SELECT FirstName,Salary FROM Employees WHERE Salary >(SELECT SALARY FROM Employees WHERE FirstName=(Select FirstName from Employees WHERE Employee_Id=6))


--Corelated Subqueries
Select Max(Salary) from Employees WHERE Department='Banking'

SELECT Department,FirstName,Salary from Employees e1 WHERE Salary = (Select Max(Salary) from Employees WHERE Department=e1.Department)