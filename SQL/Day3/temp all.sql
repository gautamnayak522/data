SELECT * FROM EMPLOYEES
--#3
SELECT employee_id,first_name,last_name,hire_date 
FROM employees 
WHERE POSITION("07" IN DATE_FORMAT(hire_date, '%d %m %Y'))>0;

SELECT EmployeeID, FirstName, LastName, HireDate 
FROM Employees
WHERE DAY(HireDate) = 7 OR MONTH(HireDate) = 7;

--#4

SELECT FirstName, LastName FROM employees WHERE INSTR(LAST_VALUE,'C') > 2;

SELECT EmployeeID, FirstName, LastName, LEN(FirstName) AS Length
FROM Employees
WHERE LastName LIKE '__%c%';



--#7
SELECT YEAR(CURRENT_TIMESTAMP) - 
         YEAR("1967-06-08") - 
             (RIGHT(CURRENT_TIMESTAMP, 5) < RIGHT('1967-06-08', 5)) as age;

                  SELECT CAST(GETDATE() AS Date) AS Today;

SELECT EmployeeID, FirstName, LastName, HireDate, CAST(GETDATE() AS Date) AS [Today], DATEDIFF(YY, HireDate, GETDATE()) AS Age
FROM Employees;

--#8

SELECT DISTINCT(STR_TO_DATE
     (CONCAT(YEAR(Hire_Date),'1'),'%x%v%w')) 
          FROM employees;

          
SELECT EmployeeID, FirstName, LastName, HireDate 
FROM employees 
WHERE DATENAME(W, HireDate)= 'Monday';

--#9 

SELECT FirstName, HireDate 
    FROM employees 
       WHERE HireDate  
         BETWEEN '1987-06-01 00:00:00' 
            AND '1987-07-30  23:59:59';

SELECT FirstName, HireDate
FROM Employees
WHERE HireDate BETWEEN '1987-06-01' AND '1987-07-30';


--#10
SELECT date_format(CURDATE(),'%W %D %M %Y %T');

SELECT FORMAT(GETDATE(), 'hh:mm tt') +
	SPACE(1) + 
	LEFT(DATENAME(MONTH, GETDATE()), 3) +
	SPACE(1)+ 
	DATENAME(DAY, GETDATE()) + 
	',' + SPACE(1) +
	DATENAME(YEAR, GETDATE())
AS TODAY;


--#11

SELECT FirstName, LastName 
    FROM employees WHERE MONTH(HireDate) =  6;

    --#12

    SELECT FirstName, SYSDATE(), HireDate, DATEDIFF( SYSDATE(), HireDate )/365
  FROM employees;

  SELECT FirstName, HireDate, DATEDIFF(year, HireDate, GETDATE()) AS Experience
FROM Employees;
 

 --#13

 SELECT FirstName, HireDate
 FROM employees
 WHERE YEAR(HireDate)=1987;



