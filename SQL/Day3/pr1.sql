SELECT ASCII ('A') AS ASCII_OF_A
SELECT CHAR(65)

DECLARE @d Date = '11/11/2015';
SELECT @d
SELECT FORMAT( @d, 'd', 'en-US' ) 'US English' ;
SELECT CONVERT(NVARCHAR, @d, 110)

SELECT ASCII('A') AS A, ASCII('B') AS B,   
ASCII('a') AS a, ASCII('b') AS b,  
ASCII(1) AS [1], ASCII(2) AS [2];  

SELECT CONCAT ( 'Happy ', 'Birthday ', 11, '/', '25' ) AS Result;  

SELECT SOUNDEX('Greeeeen'), SOUNDEX('Green')

SELECT LEFT('GAUTAM',2);  
GO

SELECT RIGHT('GAUTAM',3);  
GO

SELECT * from Employees
SELECT LEN(FirstName) AS Length, FirstName from Employees;


SELECT LOWER('gAuTAM')

SELECT UPPER('gAuTAM')

SELECT position = PATINDEX('%ter%', 'Computer');

SELECT REPLACE('Good Morning','Morning','Day');  
GO  

SELECT REVERSE(1234) AS Reversed ;  
GO  