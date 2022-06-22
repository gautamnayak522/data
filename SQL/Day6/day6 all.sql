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


---5
SELECT e.first_name, e.last_name, e.job_id, e.department_id, d.department_name 
FROM employees e 
JOIN departments d 
ON (e.department_id = d.department_id) 
JOIN locations l ON 
(d.location_id = l.location_id) 
WHERE LOWER(l.city) = 'London';

--6
SELECT department_name AS 'Department Name', 
COUNT(*) AS 'No of Employees' 
FROM departments 
INNER JOIN employees 
ON employees.department_id = departments.department_id 
GROUP BY departments.department_id, department_name 
ORDER BY department_name;

--7
SELECT employee_id, job_title, end_date-start_date Days FROM job_history 
NATURAL JOIN jobs 
WHERE department_id=90;

--8
SELECT d.department_name, e.first_name, l.city 
FROM departments d 
JOIN employees e 
ON (d.manager_id = e.employee_id) 
JOIN locations l USING (location_id);

--9
SELECT first_name, last_name, hire_date, salary, 
(DATEDIFF(now(), hire_date))/365 Experience 
FROM departments d JOIN employees e 
ON (d.manager_id = e.employee_id) 
WHERE (DATEDIFF(now(), hire_date))/365>15;



