WITH CTE_rank_employee_salary
AS(
SELECT EMPLOYEE_ID , FIRST_NAME , SALARY, 
RANK() 
OVER ( ORDER BY SALARY DESC) 
AS 'rank' FROM employees)
SELECT * FROM CTE_rank_employee_salary;  