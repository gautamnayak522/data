SELECT * FROM Manager
SELECT * FROM Employees
SELECT * FROM Incentives

--tables are created in Practice1

SELECT e1.JoiningDate, i1.INCENTIVE_DATE, DATEDIFF(MONTH,PARSE(e1.JoiningDate AS DATETIME),PARSE(i1.INCENTIVE_DATE AS DATETIME)) AS 'Diff of Months'
FROM Employees e1 JOIN Incentives i1
ON e1.Employee_Id = i1.Employee_ref_id;