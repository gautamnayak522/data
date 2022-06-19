UPDATE Employees 
SET PhoneNumber = REPLACE(PhoneNumber, '124', '999') 
WHERE phoneNumber LIKE '%124%';

SELECT * FROM Employees