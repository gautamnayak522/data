CREATE SCHEMA addassi;

CREATE TABLE addassi.Student
(
	StudentId int primary key,
	Name varchar(50) NOT NULL,
	Address varchar(50) NOT NULL,
	Board varchar(50) NOT NULL,
	CONSTRAINT CHK_BOARD CHECK (Board IN ('CBSE','State'))
)

INSERT INTO addassi.Student VALUES (1,'AAA','Ahmedabad','CBSE')
INSERT INTO addassi.Student VALUES (2,'BBB','Calcutta','State')
INSERT INTO addassi.Student VALUES (3,'CCC','Delhi','State')
INSERT INTO addassi.Student VALUES (4,'DDD','Ahmedabad','CBSE')

CREATE TABLE addassi.Marks
(
	StudentId int FOREIGN KEY REFERENCES addassi.Student(StudentId),
	Science int NOT NULL,
	Math int NOT NULL,
	English int NOT NULL,
	Average FLOAT NOT NULL,
	GRADE CHAR(2),
	CONSTRAINT CHK_MARKS CHECK(Science<=100 AND Math<=100 AND English<=100)
)

INSERT INTO addassi.Marks VALUES (1,34,90,56,67.5,'C')
INSERT INTO addassi.Marks VALUES (2,45,89,59,70.5,'B')
INSERT INTO addassi.Marks VALUES (3,56,95,62,77,'B')
INSERT INTO addassi.Marks VALUES (1,33,56,65,52.5,'C')
INSERT INTO addassi.Marks VALUES (2,66,34,68,50.5,'C')
INSERT INTO addassi.Marks VALUES (3,44,36,71,46.75,'D')
INSERT INTO addassi.Marks VALUES (4,34,38,74,46,'D')
INSERT INTO addassi.Marks VALUES (4,23,40,77,45,'D')


SELECT * FROM addassi.Student
SELECT * FROM addassi.Marks

-----------------------------------------------


ALTER PROCEDURE AVG_BASED_ON_BOARD @board varchar(50),@percentageforScience int,@percentageforMath int,@percentageforEnglish int
AS
BEGIN
	
	SELECT s.StudentId,s.Name,s.Address,s.Board,m.Science,m.Math,m.English,
	
	CASE 
	WHEN @board=s.Board THEN  ((m.Science*@percentageforScience/100)+(m.Math*@percentageforMath/100)+(m.English*@percentageforEnglish/100))
	WHEN @board=s.Board THEN  ((m.Science*@percentageforScience/100)+(m.Math*@percentageforMath/100)+(m.English*@percentageforEnglish/100)) 
	ELSE m.Average
	END AS 'AVERAGE2',

	--CASE 
	--WHEN @board=s.Board AND 'AVERAGE2'>50 THEN 'A'
	--WHEN @board=s.Board AND 'AVERAGE2'<50 THEN  'B'
	--ELSE 'F'
	--END AS GRADE2

	CASE 
	WHEN @board = s.Board AND (m.Science*@percentageforScience/100)+(m.Math*@percentageforMath/100)+(m.English*@percentageforEnglish/100) >=80 THEN 'A+'
	WHEN @board =s.Board AND (m.Science*@percentageforScience/100)+(m.Math*@percentageforMath/100)+(m.English*@percentageforEnglish/100) >=60 THEN 'A'
	WHEN @board = s.Board AND (m.Science*@percentageforScience/100)+(m.Math*@percentageforMath/100)+(m.English*@percentageforEnglish/100) >=50 THEN 'B'
	WHEN @board = s.Board AND (m.Science*@percentageforScience/100)+(m.Math*@percentageforMath/100)+(m.English*@percentageforEnglish/100) >=35 THEN 'C'
	WHEN @board = s.Board AND (m.Science*@percentageforScience/100)+(m.Math*@percentageforMath/100)+(m.English*@percentageforEnglish/100) < 35 THEN 'D'
	WHEN @board = s.Board AND (m.Science*@percentageforScience/100)+(m.Math*@percentageforMath/100)+(m.English*@percentageforEnglish/100) >=95 THEN 'A+'
	WHEN @board = s.Board AND (m.Science*@percentageforScience/100)+(m.Math*@percentageforMath/100)+(m.English*@percentageforEnglish/100) >=85 THEN 'A'
	WHEN @board = s.Board AND (m.Science*@percentageforScience/100)+(m.Math*@percentageforMath/100)+(m.English*@percentageforEnglish/100) >=75 THEN 'B'
	WHEN @board = s.Board AND (m.Science*@percentageforScience/100)+(m.Math*@percentageforMath/100)+(m.English*@percentageforEnglish/100) >50 THEN 'C'
	WHEN @board = s.Board AND (m.Science*@percentageforScience/100)+(m.Math*@percentageforMath/100)+(m.English*@percentageforEnglish/100) <50 THEN 'D'
	ELSE m.GRADE 
	END as GRADE2	

	FROM addassi.Student s JOIN addassi.Marks m
	ON s.StudentId = m.StudentId
	WHERE s.Board=@board
	ORDER BY s.StudentId
END


EXEC AVG_BASED_ON_BOARD 'State',40,40,20
EXEC  AVG_BASED_ON_BOARD 'CBSE',50,40,10


SELECT * FROM addassi.Student
SELECT * FROM addassi.Marks


--OLD GRADES

SELECT s.StudentId,s.Name,s.Address,s.Board,m.Science,m.Math,m.English,m.Average,m.GRADE 
FROM addassi.Student s JOIN addassi.Marks m
ON s.StudentId=m.StudentId
ORDER BY s.StudentId


