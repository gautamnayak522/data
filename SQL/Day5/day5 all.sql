USE myDB

SELECT * FROM Manager
SELECT * FROM Employees
SELECT * FROM Incentives

--1
SELECT e1.JoiningDate, i1.INCENTIVE_DATE, DATEDIFF(MONTH,PARSE(e1.JoiningDate AS DATETIME),PARSE(i1.INCENTIVE_DATE AS DATETIME)) AS 'Diff of Months'
FROM Employees e1 JOIN Incentives i1
ON e1.Employee_Id = i1.Employee_ref_id;


--2
SELECT e1.FirstName, i1.INCENTIVE_AMOUNT
FROM Employees e1 JOIN Incentives i1
ON e1.Employee_Id = i1.Employee_ref_id
WHERE i1.INCENTIVE_AMOUNT>3000

--3

SELECT e1.FirstName, i1.INCENTIVE_AMOUNT
FROM Employees e1 FULL JOIN Incentives i1
ON e1.Employee_Id = i1.Employee_ref_id

--4

SELECT e1.FirstName,m1.ManagerName FROM Employees e1 JOIN MANAGER m1
ON e1.ManagerId=m1.ManagerId

--5

SELECT e1.FirstName,ISNULL(i1.incentive_amount,0) as 'Incentive Amount' FROM Employees e1 LEFT JOIN Incentives i1
ON e1.Employee_Id=i1.Employee_ref_id


