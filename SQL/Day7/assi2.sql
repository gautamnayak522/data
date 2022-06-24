
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
