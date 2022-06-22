SELECT * FROM Manager
SELECT * FROM Employees
SELECT * FROM Incentives

SELECT e1.FirstName,m1.ManagerName FROM Employees e1 JOIN MANAGER m1
ON e1.ManagerId=m1.ManagerId