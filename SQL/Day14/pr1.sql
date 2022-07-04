USE myDB

SELECT * FROM CUST

ALTER TRIGGER calculate 
ON CUST
AFTER INSERT ,DELETE,UPDATE
AS 
BEGIN
	SELECT * FROM inserted
	SELECT * FROM deleted
END
GO


SELECT * FROM CUST

INSERT INTO CUST VALUES ('DDD','DDD',1500,2500)

DELETE FROM CUST WHERE JOB_ID='DDD'

UPDATE CUST 
SET MIN_SALARY = MIN_SALARY+500
WHERE JOB_ID='DDD'


---------------------

SELECT * FROM Employeetest

ALTER TABLE Employeetest
ADD  ADDRESS VARCHAR(50)

UPDATE Employeetest
SET Address = Emp_Name +' ' + Emp_City

ALTER TRIGGER setAddress
ON Employeetest
INSTEAD OF INSERT
AS
BEGIN
	SELECT * FROM inserted
	INSERT INTO Employeetest (Emp_ID,Emp_Name,Emp_Salary,Emp_City,ADDRESS) SELECT i.Emp_ID,i.Emp_Name,i.Emp_Salary,i.Emp_City,i.Emp_Name +' '+i.Emp_City  FROM inserted i
END

INSERT INTO Employeetest (Emp_ID,Emp_Name,Emp_Salary,Emp_City)VALUES (9,'AAA',50000,'ukg')

----------------

SELECT name, is_instead_of_trigger  
FROM sys.triggers    
WHERE type = 'TR';  


create trigger noop
on CUST
FOR
insert,update,delete
as
print'you can not insert,update and delete this table i'
rollback;

SELECT * FROM CUST

DROP TRIGGER noop
