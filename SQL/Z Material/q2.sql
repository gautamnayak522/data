
WITH CTE_fourth_highest_salary 
AS(
SELECT *
FROM (
SELECT SALARY,
DENSE_RANK() 
OVER ( ORDER BY SALARY DESC) 
AS 'rank' FROM employees
) employees
WHERE employees.rank=4)
SELECT * FROM CTE_fourth_highest_salary;


