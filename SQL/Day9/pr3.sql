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


  CREATE TABLE #skills
  (
	id int,
	skill varchar(50)
  )


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

  SELECT * FROM string_split('Basavaraj,Kalpana,Shree',',')
  
  SELECT value
FROM   STRING_SPLIT ('apple,banana,pineapple,grapes', ',') 

SELECT value
FROM   STRING_SPLIT ('["SQL", "C#", "Azure"]', ',') 



  insert into #skills

  select id,skill from #information where skill is not null

  SELECT skill from #information where skill is not null


--  SELECT * FROM (SELECT * FROM string_split(skill,','))subq 

	delete from #information
    delete from #skills
    delete from #personal

  select * from #information
  select * from #skills
  select * from #personal




  SELECT * FROM Employees2

SELECT *
FROM Employees2
FOR JSON PATH, WITHOUT_ARRAY_WRAPPER


