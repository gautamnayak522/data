--CTE


SELECT * FROM Employees

WITH SALARYCTE AS 
(
SELECT Employee_Id,Salary AS 'SALARIES' FROM Employees
)
SELECT e1.FirstName,temp.Salaries
FROM Employees e1 JOIN SALARYCTE temp
ON e1.Employee_Id=temp.Employee_Id



WITH empCTE
AS
(
  SELECT Employee_Id, FirstName,  YEAR(PARSE('11/11/2015' AS DATETIME)) AS HireYear
  FROM Employees   
)
 
Select * from empCTE
