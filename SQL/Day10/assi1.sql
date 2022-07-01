CREATE TABLE Employeetest
(
    Emp_ID int NOT NULL,  
    Emp_Name varchar(50) NOT NULL,  
    Emp_Salary int NOT NULL,  
    Emp_City varchar(50) NOT NULL,  
 CONSTRAINT PK_Employee PRIMARY KEY (Emp_ID)
 )

 DELETE FROM Employeetest


Insert into Employeetest
Select 1,'Pankaj',45000,'Alwar' Union All  
Select 2,'Rahul',30000,'Alwar' Union All  
Select 3,'Sandeep',60000,'Alwar' Union All  
Select 4,'Sanjeev',20000,'Alwar' Union All  
Select 5,'Neeraj',80000,'Alwar' Union All  
Select 6,'Naru',20000,'Alwar' Union All  
Select 7,'Omi',45000,'Alwar'   

SELECT * FROM Employeetest



UPDATE Employeetest SET Emp_Salary =
CASE WHEN Emp_Salary BETWEEN 30000 AND 40000 THEN Emp_Salary + 5000
WHEN Emp_Salary BETWEEN 40000 AND 55000 THEN Emp_Salary + 7000
WHEN Emp_Salary BETWEEN 55000 AND 65000 THEN Emp_Salary + 10000
ELSE Emp_Salary
END


---CURSOR

SELECT * FROM Employeetest

DECLARE @sal int

DECLARE db_cursor CURSOR FOR 

SELECT Emp_Salary 
FROM Employeetest

OPEN db_cursor 

FETCH NEXT FROM db_cursor INTO @sal

WHILE @@FETCH_STATUS = 0  
BEGIN   
		SET @sal = CASE WHEN @sal BETWEEN 30000 AND 40000 THEN @sal + 5000
					WHEN @sal BETWEEN 40000 AND 55000 THEN @sal + 7000
					WHEN @sal BETWEEN 55000 AND 65000 THEN @sal + 10000
					ELSE @sal
					END

		PRINT @sal
			UPDATE Employeetest 
				SET Emp_Salary = @sal
				WHERE  CURRENT OF db_cursor;
		FETCH NEXT FROM db_cursor INTO @sal
END 

CLOSE db_cursor  
DEALLOCATE db_cursor 


SELECT * FROM Employeetest
