---- Table Structre for Tables

CREATE TABLE Student
(
	studentid int primary key,
	name varchar(50) NOT NULL
)

SELECT * FROM STUDENT

-----------------------------------------

CREATE TABLE studentdetail 
(
	studentdetailid int primary key IDENTITY(1,1),
	studentid int,
	standard int,
	gender varchar(50),
	CONSTRAINT CHK_GENDER CHECK(gender IN('male','female')),
	CONSTRAINT FK_studentid FOREIGN KEY (studentid)
    REFERENCES Student(studentid)
)

SELECT * FROM studentdetail

------------------------------------------------

CREATE TABLE studentpresent 
(
	studentpresentid int primary key IDENTITY(1,1),
	studentid int,
	month int,
	present int,
	CONSTRAINT CHK_MONTH CHECK(month<=12),
	CONSTRAINT FK_studentid_p FOREIGN KEY (studentid)
    REFERENCES Student(studentid)
)

SELECT * FROM studentpresent

-------------------------------------------------

CREATE TABLE studenthours 
(
	studenthoursid int primary key IDENTITY(1,1),
	studentid int,
	datex date,
	hours int,
	CONSTRAINT CHK_HOURS_C CHECK(hours<=24),
	CONSTRAINT FK_studentid_h FOREIGN KEY (studentid)
    REFERENCES Student(studentid)
)

SELECT * FROM studenthours

----------------------------------------

SELECT * FROM STUDENT
SELECT * FROM studentdetail
SELECT * FROM studentpresent
SELECT * FROM studenthours
----------------------------------------

--Dumping Datas In Tables

INSERT INTO Student VALUES(1,'GAUTAM')
INSERT INTO Student VALUES(2,'YASH')
INSERT INTO Student VALUES(3,'SAUMYA')

--

INSERT INTO studentdetail VALUES (1,12,'male')
INSERT INTO studentdetail VALUES (2,11,'male')
INSERT INTO studentdetail VALUES (3,10,'female')

--
--#1
INSERT INTO studentpresent VALUES (1,1,25)
INSERT INTO studentpresent VALUES (1,2,20)
INSERT INTO studentpresent VALUES (1,3,30)
INSERT INTO studentpresent VALUES (1,4,28)
INSERT INTO studentpresent VALUES (1,5,20)
--#2
INSERT INTO studentpresent VALUES (2,1,10)
INSERT INTO studentpresent VALUES (2,2,20)
INSERT INTO studentpresent VALUES (2,3,25)
INSERT INTO studentpresent VALUES (2,4,05)
INSERT INTO studentpresent VALUES (2,5,26)
--#3
INSERT INTO studentpresent VALUES (3,1,20)
INSERT INTO studentpresent VALUES (3,2,25)
INSERT INTO studentpresent VALUES (3,3,25)
INSERT INTO studentpresent VALUES (3,4,25)
INSERT INTO studentpresent VALUES (3,5,26)

---
--#1
INSERT INTO studenthours VALUES (1,'01-01-2011',8)
INSERT INTO studenthours VALUES (1,'02-01-2011',7)
INSERT INTO studenthours VALUES (1,'03-01-2011',5)
INSERT INTO studenthours VALUES (1,'04-01-2011',3)
INSERT INTO studenthours VALUES (1,'05-01-2011',6)
--#2
INSERT INTO studenthours VALUES (2,'01-01-2011',6)
INSERT INTO studenthours VALUES (2,'02-01-2011',5)
INSERT INTO studenthours VALUES (2,'03-01-2011',8)
INSERT INTO studenthours VALUES (2,'04-01-2011',8)
INSERT INTO studenthours VALUES (2,'05-01-2011',6)
--#3
INSERT INTO studenthours VALUES (3,'01-01-2011',8)
INSERT INTO studenthours VALUES (3,'02-01-2011',7)
INSERT INTO studenthours VALUES (3,'03-01-2011',2)
INSERT INTO studenthours VALUES (3,'04-01-2011',4)
INSERT INTO studenthours VALUES (3,'05-01-2011',6)



-----------------------------------------------------------

 --  Display following details for each student:
        --   Name
        --   Standard
        --   Sex


	SELECT Student.name as Name, studentdetail.standard AS Standard, studentdetail.gender AS Sex 
	FROM Student JOIN studentdetail
	ON Student.studentid=studentdetail.studentid


	--2 Find SUM of student hours.

	SELECT s1.name,temp.Studentid,temp.SUM_OF_HOURS From 
	Student s1 JOIN (
	SELECT Studentid,SUM(hours) AS 'SUM_OF_HOURS' FROM studenthours
	GROUP BY studentid
	)temp
	ON temp.studentid=s1.studentid


	--3 Find Average Present of each student.


	SELECT s1.name,temp.Studentid,temp.AVG_OF_PRESENT From 
	Student s1 JOIN (
	SELECT studentid,AVG(present) AS 'AVG_OF_PRESENT' FROM studentpresent
	GROUP BY studentid
	)temp
	ON temp.studentid=s1.studentid

	SELECT studentid,AVG(present) AS 'AVERAGE OF STUDENT' FROM studentpresent
	GROUP BY studentid


	--4 Find Minimum present among all students.

	SELECT studentid,MIN(present) AS 'MIN OF PRESENT' FROM studentpresent
	GROUP BY studentid

			--#2
			SELECT MIN(present) AS 'MIN OF PRESENT' FROM studentpresent

	--5 Find Maximum present among all students.

	SELECT studentid,MAX(present) AS 'MAX OF PRESENT' FROM studentpresent
	GROUP BY studentid

				--#2
				SELECT MAX(present) AS 'MAX OF PRESENT' FROM studentpresent

	--6 Display fields like Name, Date, Hours from "studenthours" table where Date should be in following format 

	SELECT s1.name,temp.Studentid,temp.DATEINFORMAT From 
	Student s1 JOIN (
		SELECT studentid,CONVERT(varchar,datex,11) AS DATEINFORMAT,hours FROM studenthours
	)temp
	ON temp.studentid=s1.studentid

		
	--DATE IN FORMATS 

		SELECT studentid,datex,hours FROM studenthours   --2011-01-01

		SELECT studentid,CONVERT(varchar,datex,11),hours FROM studenthours  --11/01/01

		SELECT studentid,CONVERT(varchar,datex,1),hours FROM studenthours  --01/01/11

		SELECT studentid,CONVERT(varchar,datex,23),hours FROM studenthours  --2011-01-01

		SELECT studentid,CONVERT(varchar,datex,107),hours FROM studenthours  --Jan 01, 2011
						
		SELECT studentid,FORMAT(datex, 'dd/MM/yyyy'),hours FROM studenthours  --01/01/2011
		SELECT studentid,FORMAT(datex, 'MM-dd-yy'),hours FROM studenthours    --01-01-11
		SELECT studentid,FORMAT(datex, 'yyyy-MM-dd'),hours FROM studenthours  --2011-01-01
		SELECT studentid,FORMAT(datex, 'MM/dd'),DATEPART(WEEKDAY,datex),hours FROM studenthours  --01/01  7(SAT)

--DROP TABLE STUDENT
--DROP TABLE studentdetail
--DROP TABLE studentpresent
--DROP TABLE studenthours