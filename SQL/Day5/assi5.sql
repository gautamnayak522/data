SELECT * FROM Manager
SELECT * FROM Employees
SELECT * FROM Incentives


SELECT e1.FirstName,ISNULL(i1.incentive_amount,0) as 'Incentive Amount' FROM Employees e1 LEFT JOIN Incentives i1
ON e1.Employee_Id=i1.Employee_ref_id