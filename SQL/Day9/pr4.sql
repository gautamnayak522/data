USE myDB

SELECT * FROM Employees2

DECLARE @stud_json NVARCHAR(MAX)
SET @stud_json = 
'[
		{
			"id":1,
			"Name":"GAUTAM",
			"Address":"Porbandar"
		},
		{
			"id":2,
			"Name":"YASH",
			"Address":"RAJKOT"
		},
		{
			"id":2,
			"Name":"YASH"
		}
]'

--PRINT @stud_json

--JSON TO TABLES


SELECT * FROM OPENJSON(@stud_json)
WITH
(
	id int '$.id',
	Name varchar(50) '$.Name',
	Address varchar(50) '$.Address'
)

CREATE TABLE #temptable(
	id int,
	Name varchar(50),
	Address varchar(50)
)

INSERT INTO #temptable
SELECT * FROM OPENJSON(@stud_json)
WITH
(
	id int '$.id',
	Name varchar(50) '$.Name',
	Address varchar(50) '$.Address'
)

SELECT * FROM #temptable


--Tables to JSON

SELECT Employee_Id, First_Name AS "fullname.name", Last_Name AS "fullname.surname", JoiningDate AS jod
FROM Employees2
FOR JSON PATH;

SELECT Employee_Id, First_Name AS "fullname.name", Last_Name AS "fullname.surname", JoiningDate AS jod
FROM Employees2
FOR JSON AUTO;


--######## OPENJSON
DECLARE @json NVARCHAR(MAX);
SET @json = N'[
  {"id": 2, "info": {"name": "John", "surname": "Smith"}, "age": 25},
  {"id": 5, "info": {"name": "Jane", "surname": "Smith"}, "dob": "2005-11-04T12:00:00"}
]';

SELECT *
FROM OPENJSON(@json)
  WITH (
    id INT '$.id',
    firstName NVARCHAR(50) '$.info.name',
    lastName NVARCHAR(50) '$.info.surname',
    age INT,
    dateOfBirth DATETIME2 '$.dob'
  );


--####### OPENJSON- WITH OUTER

  DECLARE @json NVARCHAR(MAX);
SET @json = N'[  
  {"id": 2, "info": {"name": "John", "surname": "Smith"}, "age": 25},
  {"id": 5, "info": {"name": "Jane", "surname": "Smith", "skills": ["SQL", "C#", "Azure"]}, "dob": "2005-11-04T12:00:00"}  
]';

SELECT id, firstName, lastName, age, dateOfBirth, skill  
FROM OPENJSON(@json)  
  WITH (
    id INT 'strict $.id',
    firstName NVARCHAR(50) '$.info.name',
    lastName NVARCHAR(50) '$.info.surname',  
    age INT,
    dateOfBirth DATETIME2 '$.dob',
    skills NVARCHAR(MAX) '$.info.skills' AS JSON
  )
OUTER APPLY OPENJSON(skills)
  WITH (skill NVARCHAR(8) '$');