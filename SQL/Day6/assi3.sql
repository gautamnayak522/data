CREATE VIEW VW_EMP_INC
AS
SELECT e1.FIRST_NAME,e1.Last_Name,e1.Salary,e1.JoiningDate,i1.INCENTIVE_DATE,i1.INCENTIVE_AMOUNT 
FROM Employees e1 JOIN Incentives i1
ON e1.Employee_Id = i1.Employee_ref_id;

SELECT * FROM VW_EMP_INC