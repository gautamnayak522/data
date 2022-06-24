--Day4

SELECT DENSE_RANK() OVER( ORDER BY Salary desc) AS [Rank], FirstName, Salary FROM Employees  

--CTE

WITH RANKSALARYINORDER
AS
(
  SELECT DENSE_RANK() OVER( ORDER BY Salary desc) AS [Rank], FirstName, Salary FROM Employees    
)
 
Select * from RANKSALARYINORDER

--Derived table

--second highest salary

SELECT Rank,FirstName, SALARY FROM (
SELECT DENSE_RANK() OVER( ORDER BY Salary desc) AS [Rank], FirstName, Salary FROM Employees    
) myderivedtable
WHERE Rank=2

--second highest salary (TOP 1)

SELECT TOP 1 Rank,FirstName, SALARY FROM (
SELECT DENSE_RANK() OVER( ORDER BY Salary desc) AS [Rank], FirstName, Salary FROM Employees    
) myderivedtable
WHERE Rank=2



WITH  DEPT_WITH_SUM_OF_SALARY
AS
(
SELECT DepartmentId, SUM(SALARY) AS 'SUM OF SALARY'
FROM EMPLOYEES
GROUP BY DepartmentID
)

SELECT * FROM DEPT_WITH_SUM_OF_SALARY


----

WITH  DEPT_WITH_MAX_OF_SALARY
AS
(
SELECT DepartmentId, MAX(SALARY) AS 'MAX SALARY'
FROM EMPLOYEES
GROUP BY DepartmentID 
)

SELECT * FROM DEPT_WITH_MAX_OF_SALARY ORDER BY 'MAX SALARY'

