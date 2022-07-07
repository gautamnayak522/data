/*
Assignment Module 11,Module 12 (Q1-Q6)
Module 11 : Q1,Q3,Q5
Module 12 : Q2,Q4,Q6
*/
-----------------------------
USE myDB
SELECT * FROM BRANCH
SELECT * FROM CUSTOMER
SELECT * FROM DEPOSIT
SELECT * FROM BORROW

-------------------------------------
--#1   Q2
--Create a Store Procedure which will accept name of the customer as input parameter and produce the following output List in JSON format, 
--All the Depositors Having Depositors Having Deposit in All the Branches where input parameter customer is Having an Account

INSERT INTO DEPOSIT VALUES (110,'PRAMOD','VRCE',15000,'11-11-2015')

CREATE PROCEDURE SP_CUSTOMER_OP_JSON1 @cname VARCHAR(50)
AS
BEGIN
	SET NOCOUNT ON
	SELECT CNAME AS 'Name',BNAME as 'BANK' FROM DEPOSIT WHERE BNAME IN (SELECT BNAME FROM DEPOSIT WHERE CNAME=@cname) FOR JSON PATH,Root('List of customers')

END

EXECUTE SP_CUSTOMER_OP_JSON1 'PRAMOD'

DROP PROCEDURE SP_CUSTOMER_OP_JSON1


--#2 Q4 Create a Store Procedure which will accept city of the customer as input parameter and product the following output List in JSON format 
--List All the Customers Living in city provided in input parameter and Having the Branch City as MUMBAI or DELHI


CREATE PROCEDURE CUSTOMER_IN_CITY_JSON2 @CITY VARCHAR(50)
AS
BEGIN
	SET NOCOUNT ON
	SELECT CNAME,CITY FROM CUSTOMER WHERE CITY IN (@CITY,'MUMBAI','DELHI')
END

EXECUTE CUSTOMER_IN_CITY_JSON2 'MUMBAI'
EXECUTE CUSTOMER_IN_CITY_JSON2 'BARODA'
EXECUTE CUSTOMER_IN_CITY_JSON2 'NAGPUR'

SELECT * FROM CUSTOMER



--#3 Q6 Create a Procedure which will accept input in JSON parameter CustomerName, City, ACTNO, Branch, amount And insert these record in the Deposit table. 
--Before inserting some validation should be done like amount should be greater than 10Rs. and date should always be current date.-

CREATE PROCEDURE JSON_INSERT(@newdeposit NVARCHAR(MAX))
AS 
BEGIN
  INSERT INTO DEPOSIT(ACTNO,CNAME,BNAME,AMOUNT,ADATE)
  SELECT ACTNO,CNAME,BNAME,AMOUNT,ADATE
  FROM OPENJSON(@newdeposit)
       WITH (ACTNO varchar(50), 
			CNAME varchar(50), 
			BNAME varchar(50),
			 AMOUNT int, 
			 ADATE date
		)
END

DECLARE @json NVARCHAR(MAX);
SET @json = ' 
  {"ACTNO":"111","CNAME":"SUNIL","BNAME":"POWAI","AMOUNT":"1500","ADATE":"1995-03-01"}
';
PRINT @json

EXECUTE JSON_INSERT @json

SELECT * FROM DEPOSIT

DELETE FROM DEPOSIT WHERE ACTNO=111
