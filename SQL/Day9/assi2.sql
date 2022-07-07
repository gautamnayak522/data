USE myDB

DECLARE @stud_json NVARCHAR(MAX)

SET @stud_json = 
'[
		{
			"id":1,
			"Name":"AAA",
			"Address":"aaaaaaaaaa",
			"city":"Porbandar",
			"DOB":"08/04/2001",
			"Standard":"12"
		},
		{
			"id":2,
			"Name":"BBB",
			"Address":"aaaaaaaaaa",
			"city":"Porbandar",
			"DOB":"08/04/2001",
			"Standard":"12"
		},
		{
			"id":3,
			"Name":"CCC",
			"Address":"aaaaaaaaaa",
			"city":"Porbandar",
			"DOB":"08/04/2001",
			"Standard":"12"
		},
		{
			"id":4,
			"Name":"DDD",
			"Address":"aaaaaaaaaa",
			"city":"Porbandar",
			"DOB":"08/04/2001",
			"Standard":"12"
		},
		{
			"id":5,
			"Name":"EEE",
			"Address":"aaaaaaaaaa",
			"city":"Porbandar",
			"DOB":"08/04/2001",
			"Standard":"12"
		}
]'

PRINT @stud_json
PRINT ISJSON(@stud_json)

--JSON TO TABLES

IF NOT EXISTS (SELECT * FROM sysobjects WHERE name='studentdata')
CREATE TABLE studentdata(
	id int,
	Name varchar(50),
	Address varchar(50),
	city varchar(50),
	DOB date,
	Standard int
)


INSERT INTO studentdata
SELECT * FROM OPENJSON(@stud_json)
WITH
(
	id int '$.id',
	Name varchar(50) '$.Name',
	Address varchar(50) '$.Address',
	city varchar(50) '$.city',
	DOB date '$.DOB',
	Standard int '$.Standard'
)

SELECT * FROM studentdata

--Table to JSON

SELECT id, Name, Address AS "Addressinfo.Address",city AS "Addressinfo.city", DOB,Standard
FROM studentdata
FOR JSON PATH


--------
DECLARE @stud_json2 NVARCHAR(MAX)

SET @stud_json2 = 
(SELECT id, Name, Address AS "Addressinfo.Address",city AS "Addressinfo.city", DOB,Standard
FROM studentdata
FOR JSON PATH)

PRINT @stud_json2

