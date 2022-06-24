CREATE VIEW VW_EMP_TASK5
AS 
SELECT e1.First_Name,e1.Last_Name, e1.JOB_ID, d1.Department_Id,d1.Department_Name
FROM Employees e1 JOIN departments d1
ON e1.Department_id = d1.Department_id
JOIN locations l1
ON d1.LOCATION_ID=l1.LOCATION_ID
WHERE l1.CITY='London'


SELECT * FROM VW_EMP_TASK5