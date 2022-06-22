--pr2
SELECT * FROM Employees
SELECT * FROM Manager

--Inner Join
SELECT Employees.Employee_Id,Employees.FirstName,Employees.ManagerId,Manager.ManagerName 
FROM Employees join Manager 
ON Employees.ManagerId=Manager.ManagerId

--left outer join
SELECT Employees.Employee_Id,Employees.FirstName,Employees.ManagerId,Manager.ManagerName 
FROM Employees left outer join Manager 
ON Employees.ManagerId=Manager.ManagerId

--right outer join
SELECT Employees.Employee_Id,Employees.FirstName,Employees.ManagerId,Manager.ManagerName 
FROM Employees right outer join Manager 
ON Employees.ManagerId=Manager.ManagerId

--full outer join
SELECT Employees.Employee_Id,Employees.FirstName,Employees.ManagerId,Manager.ManagerName 
FROM Employees full outer join Manager 
ON Employees.ManagerId=Manager.ManagerId

