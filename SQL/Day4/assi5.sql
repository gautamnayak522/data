SELECT DepartmentId, MAX(SALARY) AS 'MAX SALARY'
FROM EMPLOYEES
GROUP BY DepartmentID ORDER BY 'MAX SALARY'