
DECLARE @stud_json NVARCHAR(MAX)
SET @stud_json = 
'{
	"Students" : [ 
		{
			"id":1,
			"Name":"GAUTAM",
			"Address":"Porbandar"
		},
		{
			"id":2,
			"Name":"YASH",
			"Address":"RAJKOT"
		}
		]
}'

--check for valid json 1/0
PRINT ISJSON(@stud_json)

--returns scaller value
SELECT JSON_VALUE (@stud_json,'$.Students[0].Name') AS 'Name of Student1'

--returns object or an array
PRINT JSON_QUERY (@stud_json,'$.Students[0]')

--json_modify - update

SET @stud_json = JSON_MODIFY(@stud_json,'$.Students[0].Name', 'NAYAK')

SELECT JSON_VALUE (@stud_json,'$.Students[0].Name') AS 'Name of Student1'

PRINT @stud_json


--json_modify - insert


SELECT value FROM STRING_SPLIT('Roberto,Gail,Dylan', ',');




DECLARE @stud_json2 NVARCHAR(MAX)
SET @stud_json2 = 
' [ 
		{
			"id":1,
			"Name":"GAUTAM",
			"Address":"Porbandar"
		},
		{
			"id":2,
			"Name":"YASH",
			"Address":"RAJKOT"
		}
]'
PRINT @stud_json2

SELECT ISJSON(@stud_json2)
SELECT JSON_VALUE (@stud_json2,'$') AS 'Name of Student1'
SELECT JSON_QUERY (@stud_json2,'$') AS 'Name of Student1'


-------

DECLARE @json NVARCHAR(MAX)

SET @json='{"name":"John","surname":"Doe","age":45,"skills":["SQL","C#","MVC"]}';

SELECT *
FROM OPENJSON(@json);
