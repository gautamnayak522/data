USE myDB
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

SELECT FIRST_NAME,Salary FROM Employees WHERE Salary >(SELECT SALARY FROM Employees WHERE First_Name='Roy')

--3
DROP VIEW VW_EMP_INC

CREATE VIEW VW_EMP_INC
AS
SELECT e1.FIRST_NAME,e1.Last_Name,e1.Salary,e1.JoiningDate,i1.INCENTIVE_DATE,i1.INCENTIVE_AMOUNT 
FROM Employees e1 JOIN Incentives i1
ON e1.Employee_Id = i1.Employee_ref_id;

SELECT * FROM VW_EMP_INC

--4
DROP VIEW VW_EMP_INC2

CREATE VIEW VW_EMP_INC2
AS
SELECT e1.First_Name,i1.INCENTIVE_AMOUNT 
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
SELECT e1.First_Name,e1.Last_Name, e1.JOB_ID, d1.Department_Id,d1.Department_Name
FROM Employees e1 JOIN departments d1
ON e1.Department_id = d1.Department_id
JOIN locations l1
ON d1.LOCATION_ID=l1.LOCATION_ID
WHERE l1.CITY='London'


SELECT * FROM VW_EMP_TASK5


--6

SELECT * FROM Employees
SELECT * FROM departments

DROP VIEW VW_EMP_6

CREATE VIEW VW_EMP_TASK6
AS
SELECT d1.Department_Name, COUNT(*) As 'No. of Employees'
FROM departments d1 JOIN Employees e1
ON d1.Department_ID = e1.Department_ID
GROUP BY d1.DEPARTMENT_NAME

SELECT * FROM VW_EMP_TASK6

--7

SELECT EMPLOYEE_ID From Employees

CREATE VIEW VW_EMP_TASK7
AS
SELECT jh1.employee_id, j1.job_title,jh1.DEPARTMENT_ID,jh1.START_DATE,jh1.END_DATE, DATEDIFF(Day,jh1.START_DATE,jh1.END_DATE) AS 'DIFF OF DAYS'
FROM 
job_history jh1 JOIN jobs j1
ON j1.JOB_ID=jh1.JOB_ID
WHERE jh1.department_id=90;

SELECT * FROM VW_EMP_TASK7


--8

SELECT * FROM employees
SELECT * FROM departments
SELECT * FROM locations

CREATE VIEW VW_EMP_TASK8
AS
SELECT d1.DEPARTMENT_NAME,e1.FIRST_NAME,l1.CITY FROM
employees e1 JOIN departments d1 
ON d1.MANAGER_ID=e1.EMPLOYEE_ID
JOIN locations l1
ON d1.LOCATION_ID=l1.LOCATION_ID

SELECT * FROM VW_EMP_TASK8


--9

SELECT * FROM employees
SELECT * FROM departments

CREATE VIEW VW_EMP_TASK9
AS
SELECT d1.DEPARTMENT_NAME,(e1.FIRST_NAME+' '+e1.LAST_NAME) AS 'Names',e1.HIRE_DATE,e1.SALARY FROM
employees e1 JOIN departments d1 
ON d1.MANAGER_ID=e1.EMPLOYEE_ID
WHERE DATEDIFF(YEAR,e1.HIRE_DATE,GETDATE())>15


SELECT * FROM VW_EMP_TASK9


SELECT DATEDIFF(YEAR,HIRE_DATE,GETDATE()) FROM employees


SELECT * INTO CUST FROM jobs
SELECT * FROM CUST

