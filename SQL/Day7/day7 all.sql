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


--Day5

USE myDB
SELECT * FROM Manager
SELECT * FROM Employees
SELECT * FROM Incentives


--CTE

WITH DAY5TASK
AS
(
SELECT e1.JoiningDate, i1.INCENTIVE_DATE, DATEDIFF(MONTH,PARSE(e1.JoiningDate AS datetime),PARSE(i1.INCENTIVE_DATE AS DATETIME)) AS 'Diff of Months'
FROM Employees2 e1 JOIN Incentives i1
ON e1.Employee_Id = i1.Employee_ref_id
)

SELECT * FROM DAY5TASK

--Derived Table

SELECT JoiningDate,Incentive_Amount,DATEDIFF(MONTH,PARSE(JoiningDate AS datetime),PARSE(INCENTIVE_DATE AS DATETIME)) AS 'Diff of Months' FROM 
(
SELECT * FROM 
Employees2 e1 JOIN Incentives i1
ON e1.Employee_Id = i1.Employee_ref_id
)BOTHTABLES 


--Derived tables
SELECT * FROM Employees2

SELECT EmployeeName,managername
FROM (
SELECT e1.Employee_Id,e1.First_Name AS 'EmployeeName',e1.ManagerId,e2.First_Name AS 'managerName' FROM 
Employees2 e1 LEFT JOIN Employees2 e2
ON e1.ManagerId=e2.Employee_Id
)alldata


--CTE with derived table

WITH EMPMAN
AS
(
SELECT EmployeeName,managername
FROM (
SELECT e1.Employee_Id,e1.First_Name AS 'EmployeeName',e1.ManagerId,e2.First_Name AS 'managerName' FROM 
Employees2 e1 LEFT JOIN Employees2 e2
ON e1.ManagerId=e2.Employee_Id
)alldata
)

SELECT * FROM EMPMAN





