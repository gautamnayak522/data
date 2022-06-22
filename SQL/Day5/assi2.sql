SELECT * FROM Manager
SELECT * FROM Employees
SELECT * FROM Incentives

SELECT e1.FirstName, i1.INCENTIVE_AMOUNT
FROM Employees e1 JOIN Incentives i1
ON e1.Employee_Id = i1.Employee_ref_id
WHERE i1.INCENTIVE_AMOUNT>3000