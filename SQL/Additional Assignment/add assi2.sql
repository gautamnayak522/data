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
	studentdetailid int primary key,
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
	studentpresentid int primary key,
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
	studenthoursid int primary key,
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

INSERT INTO studentdetail VALUES (1,1,12,'male')
INSERT INTO studentdetail VALUES (2,2,11,'male')
INSERT INTO studentdetail VALUES (3,3,10,'female')

INSERT INTO studentpresent VALUES (1,1,11,25)
INSERT INTO studentpresent VALUES (2,2,11,20)
INSERT INTO studentpresent VALUES (3,3,11,18)

INSERT INTO studenthours VALUES (1,1,'01-01-2011',8)
INSERT INTO studenthours VALUES (2,2,'01-01-2011',9)
INSERT INTO studenthours VALUES (3,3,'01-01-2011',13)


-----------------------------------------------------------

 --  Display following details for each student:
        --   Name
        --   Standard
        --   Sex


	SELECT Student.name as Name, studentdetail.standard AS Standard, studentdetail.gender AS Sex 
	FROM Student JOIN studentdetail
	ON Student.studentid=studentdetail.studentid


	--2 Find SUM of student hours.

	SELECT SUM(hours) AS 'SUM OF HOURS' from studenthours
