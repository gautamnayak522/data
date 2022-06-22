SELECT * FROM Manager
SELECT * FROM Employees
SELECT * FROM Incentives

--1

CREATE TABLE FORDELETE(
id int)
SELECT * FROM FORDELETE
insert into FORDELETE VALUES(4)
DROP TABLE FORDELETE

SELECT * FROM Employees WHERE EXISTS (SELECT * FROM Incentives)


--2

SELECT FirstName,Salary FROM Employees WHERE Salary >(SELECT SALARY FROM Employees WHERE FirstName='Roy')


--3
CREATE VIEW VW_EMP_INC
AS
SELECT e1.FirstName,e1.LastName,e1.Salary,e1.JoiningDate,i1.INCENTIVE_DATE,i1.INCENTIVE_AMOUNT 
FROM Employees e1 JOIN Incentives i1
ON e1.Employee_Id = i1.Employee_ref_id

SELECT * FROM VW_EMP_INC

--4

CREATE VIEW VW_EMP_INC2
AS
SELECT e1.FirstName,i1.INCENTIVE_AMOUNT 
FROM Employees e1 JOIN Incentives i1
ON e1.Employee_Id = i1.Employee_ref_id
WHERE i1.INCENTIVE_AMOUNT>3000

SELECT * FROM VW_EMP_INC2


--5

SELECT * FROM Employees
SELECT * FROM departments
SELECT * FROM jobs
SELECT * FROM job_history
SELECT * FROM locations
SELECT * FROM Countries
SELECT * FROM regions


DROP VIEW VW_EMP_TASK5

CREATE VIEW VW_EMP_TASK5
AS 
SELECT e1.First_Name,e1.Last_Name,d1.Department_Id,d1.Department_Name,j1.JOB_ID,j1.JOB_TITLE
FROM Employees e1 JOIN departments d1
ON e1.Department_id = d1.Department_id
JOIN Jobs j1
ON j1.JOB_ID=e1.JOB_ID


SELECT * FROM VW_EMP_TASK5


--6

SELECT * FROM Employees
SELECT * FROM departments

DROP VIEW VW_EMP_6

CREATE VIEW VW_EMP_TASK6
AS
SELECT d1.Department_Name, e1.Employee_Id
FROM departments d1 JOIN Employees e1
ON d1.Department_ID = e1.Department_ID


SELECT * FROM VW_EMP_TASK6












emp-jobs-dept-man
coutry-region




