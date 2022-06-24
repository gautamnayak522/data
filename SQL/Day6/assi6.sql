SELECT * FROM Employees
SELECT * FROM departments

CREATE VIEW VW_EMP_TASK6
AS
SELECT d1.Department_Name, COUNT(*) As 'No. of Employees'
FROM departments d1 JOIN Employees e1
ON d1.Department_ID = e1.Department_ID
GROUP BY d1.DEPARTMENT_NAME

SELECT * FROM VW_EMP_TASK6