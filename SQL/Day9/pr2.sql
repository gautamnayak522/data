
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
PRINT ISJSON(@stud_json)

SELECT JSON_VALUE (@stud_json,'$.Students[0].Name') AS 'Name of Student1'

PRINT JSON_QUERY (@stud_json,'$.Students[0]')

SET @stud_json = JSON_MODIFY(@stud_json,'$.Students[0].Name', 'NAYAK')

SELECT JSON_VALUE (@stud_json,'$.Students[0].Name') AS 'Name of Student1'
PRINT @stud_json
