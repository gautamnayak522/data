use AdventureWorksDW2019

select * from DimEmployee

--assi1
UPDATE DimEmployee
SET EmailAddress='Not Available';

--assi2
UPDATE DimEmployee
SET EmailAddress='Not Available',BaseRate=0.10;

--assi3
UPDATE DimEmployee
SET EmailAddress='Not Available',BaseRate=0.10 
where EmployeeKey=1 ;

--assi4
UPDATE DimEmployee
SET EmailAddress='Not Available'
where DepartmentName='marketing' and BaseRate<20 ;

--assi5
UPDATE DimEmployee
SET EmailAddress='Not Available'
where DepartmentName='assioduction';

--assi6 Write a SQL statement to change salary of employee to 8000 whose ID is 105, if the existing salary is less than 5000.
UPDATE DimEmployee
SET VacationHours=50
where EmployeeKey=1 and VacationHours<30;


--assi7 Write a SQL statement to change job ID of employee which ID is 118, 
      --to SH_CLERK if the employee belongs to department, which ID is 30 and the existing job ID does not start with SH.

select * from DimEmployee
select EmployeeKey as aaaa,FirstName as fnameslist, totalvalue=EmployeeKey*8 from DimEmployee

use test2
SELECT * FROM department
SELECT * FROM Employees
SELECT * FROM Jobs


-- 7--
UPDATE Employees
SET FirstName='SH_EMP'
where Employee_Id=1 and FirstName NOT LIKE 'SH%' and  Department_Id=1

SELECT LastName FROM Employees WHERE LastName NOT like 'z%'

USE Test2
SELECT * FROM department
SELECT * FROM Employees
SELECT * FROM Jobs

--- 8 --
INSERT INTO department VALUES(4,'Mobile')
INSERT INTO Employees values(6,'AAA','BBB','G@G.COM',1111111112,'14/02/2022',2,55000,5000,2,4)

UPDATE Employees
SET Salary=Salary+Salary*.25
WHERE Department_Id=1 

UPDATE Employees
SET Salary = Salary+Salary*.15
WHERE Department_Id=2

UPDATE Employees
SET Salary = Salary+Salary*.10
WHERE Department_Id=3


UPDATE  Employees
SET Salary = case
when Department_Id = 1 then Salary+Salary*.25
when Department_Id = 2 then Salary+Salary*.15
when Department_Id = 3 then Salary+Salary*.10
else Salary
end

UPDATE Employees
SET Salary=55000


---9-----

UPDATE jobs
SET MinSalary = MinSalary+2000,MaxSalary=MaxSalary+2000
WHERE JobTitle='Software Engineer'

UPDATE Employees
SET Salary = Salary+Salary*.20,Commission=Commission+Commission*.10
WHERE Job_Id=1


----10---

SELECT * FROM Employees
SELECT FirstName,LastName FROM Employees
SELECT FirstName AS EMPLOYEE_NAME FROM Employees
SELECT * FROM Employees WHERE FirstName='AAA'
SELECT * FROM Employees WHERE FirstName='AAA' or FirstName='SH_EMP'
SELECT * FROM Employees WHERE FirstName in('aaa','sh_emp')


SELECT * FROM Employees WHERE FirstName NOT in('aaa','sh_emp')

