WITH CTE_salary_greater_bruce
AS
(SELECT FIRST_NAME,SALARY
FROM employees 
WHERE EMPLOYEE_ID IN 
	(SELECT EMPLOYEE_ID 
	FROM employees
    WHERE SALARY>(
		SELECT SALARY
		FROM employees
		WHERE FIRST_NAME='Bruce')))
SELECT * FROM CTE_salary_greater_bruce;