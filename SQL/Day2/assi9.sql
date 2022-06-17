-- Write a SQL statement to increase the minimum and maximum salary of PU_CLERK by 2000 as well as the salary for those employees by 20% 
-- and commission by 10% .


SELECT * FROM EMPLOYEES

UPDATE jobs
SET MinSalary = MinSalary+2000,MaxSalary=MaxSalary+2000
WHERE JobTitle='Software Engineer'

UPDATE Employees
SET Salary = Salary+Salary*.20,CommissionPct=CommissionPct+CommissionPct*.10
WHERE JobId='PU_CLERK'