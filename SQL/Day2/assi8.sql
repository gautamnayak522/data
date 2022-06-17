-- Write a SQL statement to increase the salary of employees under the department 40, 90 and 110 according to the company rules that, 
--salary will be increased by 25% for the department 40, 15% for department 90 and 10% for the department 110 and the rest of the 
--departments will remain same.

SELECT * FROM Employees

UPDATE  Employees
SET Salary = case
when DepartmentID = 40 then Salary+Salary*.25
when DepartmentID = 90 then Salary+Salary*.15
when DepartmentID = 110 then Salary+Salary*.10
else Salary
end


-- Individual Id wise update

UPDATE Employees
SET Salary=Salary+Salary*.25
WHERE DepartmentID = 40

UPDATE Employees
SET Salary = Salary+Salary*.15
WHERE DepartmentID = 90

UPDATE Employees
SET Salary = Salary+Salary*.10
WHERE DepartmentID = 110

