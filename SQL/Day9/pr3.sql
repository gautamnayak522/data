create table #information
(
id int,
 firstName varchar(100), 
 lastName varchar(100), 
 age int,
dateOfBirth date, 
skill varchar(100)
)

DECLARE @json NVARCHAR(MAX);
SET @json = N'[  
  {"id": 2, "info": {"name": "John", "surname": "Smith"}, "age": 25},
  {"id": 5, "info": {"name": "Jane", "surname": "Smith", "skills": ["SQL", "C#", "Azure"]}, "dob": "2005-11-04T12:00:00"}  
]';

insert into #information 
SELECT  id, firstName, lastName, age, dateOfBirth, skills
FROM OPENJSON(@json)  
  WITH (
    id INT 'strict $.id',
    firstName NVARCHAR(50) '$.info.name',
    lastName NVARCHAR(50) '$.info.surname',  
    age INT,
    dateOfBirth DATETIME2 '$.dob',
    skills NVARCHAR(MAX) '$.info.skills' AS JSON
  )


  select * from #information

	CREATE TABLE #personal
	(
		id int,
		firstname varchar(50),
		lastname varchar(50),
		age int,
		dateOfBirth date
	)


  insert into #personal 
  select id, firstName, lastName, age, dateOfBirth  from #information
  group by id,firstName,lastName,age,dateOfBirth


  CREATE TABLE #skills
  (
	id int,
	skill varchar(50)
  )

  /*
  insert into #skills
  select t1.id,t2.skill 
  from #information t1 CROSS JOIN #information t2
  --ON t1.id=t2.id
  where t2.skill is not null
  */

  insert into #skills
  select id,
  value skill  
  from #information 
  CROSS APPLY STRING_SPLIT(skill, ',') 
  where skill is not null

  insert into #skills
  select id,
  value skill  
  from #information 
  CROSS APPLY  STRING_SPLIT(SUBSTRING(skill,2,LEN(skill)-2), ',') 
  where skill is not null

  SELECT skill from #information where skill is not null


  select * from #information
  select * from #skills
  select * from #personal    


						delete from #information
						delete from #skills
						delete from #personal


  ------------------
	
	SELECT * FROM (SELECT * FROM string_split('a,b,c',','))subq 

    SELECT * FROM string_split('Basavaraj,Kalpana,Shree',',')
  
  SELECT value
FROM   STRING_SPLIT ('apple,banana,pineapple,grapes', ',') 

SELECT value FROM   STRING_SPLIT(SUBSTRING('["SQL", "C#", "Azure"]',2,LEN('["SQL", "C#", "Azure"]')-2), ',') 

----------------


  SELECT * FROM Employees2

  -- WITHOUT_ARRAY_WRAPPER

SELECT *
FROM Employees2
FOR JSON PATH, WITHOUT_ARRAY_WRAPPER



