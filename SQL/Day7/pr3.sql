--CTE


SELECT * FROM Employees

WITH SALARYCTE AS 
(
SELECT Employee_Id,Salary AS 'SALARIES' FROM Employees
)
SELECT e1.FirstName,temp.Salaries
FROM Employees e1 JOIN SALARYCTE temp
ON e1.Employee_Id=temp.Employee_Id



WITH empCTE
AS
(
  SELECT Employee_Id, FIRST_NAME,  YEAR(HIRE_DATE) AS HireYear
  FROM Employees   
)
 
Select * from empCTE


USE myDB
SELECT * FROM locations

SELECT COUNTRY_ID, COUNT(*) FROM locations
GROUP BY COUNTRY_ID

SELECT * FROM employees

--subq
--second highest using subq

SELECT TOP 1 FIRST_NAME, SALARY FROM (
SELECT TOP 2 First_Name,Salary FROM employees
ORDER BY SALARY DESC ) TOP2 ORDER BY SALARY 

---max salary

select * from employees where salary=(select Max(salary) from employees);

--second highest using rank
select TOP 1  * from (select First_Name, salary, dense_rank() over(order by salary desc)rank from Employees)subq where rank=2