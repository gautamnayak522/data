CREATE SCHEMA trig

CREATE TABLE trig.Student
(
	StudentID INT,
	StudentName VARCHAR(50) NOT NULL,
	TotalFees INT NOT NULL,
	RemainingAmt INT NOT NULL,
	CONSTRAINT PK_STDID PRIMARY KEY(StudentID)
)


CREATE TABLE trig.Course 
(
	CourseID INT,
	CourseName VARCHAR(50) NOT NULL,
	TotalFees INT NOT NULL
	CONSTRAINT PK_COURSEID PRIMARY KEY(CourseID)
)

INSERT INTO trig.Student VALUES (1,'GAUTAM',0,0)
INSERT INTO trig.Student VALUES (2,'YASH',0,0)
INSERT INTO trig.Student VALUES (3,'SAUMYA',0,0)
INSERT INTO trig.Student VALUES (4,'VIDHI',0,0)

INSERT INTO trig.Course VALUES (1,'HTML',1000)
INSERT INTO trig.Course VALUES (2,'CSS',800)
INSERT INTO trig.Course VALUES (3,'Angular',3000)
INSERT INTO trig.Course VALUES (4,'Node',2000)
INSERT INTO trig.Course VALUES (6,'SQL',2500)

SELECT * FROM trig.Student
SELECT * FROM trig.Course

CREATE TABLE trig.CourseEnrolled 
(
	StudentID INT,
	CourseID INT,
	CONSTRAINT FK_StdID FOREIGN KEY (StudentID) REFERENCES trig.Student(StudentID),
	CONSTRAINT FK_CourseID FOREIGN KEY (CourseID) REFERENCES trig.Course(CourseID)
)

CREATE TABLE trig.FeePayment (
	StudentID INT,
	AmountPaid INT,
	DateofPayment date
	CONSTRAINT FK_StudID_fees FOREIGN KEY(StudentID) REFERENCES trig.Student(StudentID)
)

SELECT * FROM trig.Student
SELECT * FROM trig.Course
SELECT * FROM trig.CourseEnrolled
SELECT * FROM trig.FeePayment

---UPDATING TOTAL_FEES

CREATE TRIGGER updatingtotalfees
ON trig.CourseEnrolled
AFTER INSERT
AS
BEGIN
	SET NOCOUNT ON
	DECLARE @s_id INT,@c_id INT
	SELECT @s_id=StudentID, @c_id=CourseID FROM inserted

	DECLARE @c_fee INT
	SELECT @c_fee=TotalFees FROM trig.Course WHERE CourseID=@c_id
	
	UPDATE trig.Student
	SET TotalFees = TotalFees + @c_fee,
		RemainingAmt=RemainingAmt+@c_fee
	WHERE StudentID=@s_id
END


--#1
INSERT INTO trig.CourseEnrolled VALUES (1,1)
INSERT INTO trig.CourseEnrolled VALUES (1,4)
INSERT INTO trig.CourseEnrolled VALUES (2,2)

DELETE FROM trig.CourseEnrolled


--- UPDATING REM_FEES

CREATE TRIGGER updateremainingfees
ON trig.FeePayment
AFTER INSERT 
AS
BEGIN
	DECLARE @s_id INT,@amt_paid INT
	SELECT @s_id = StudentID,@amt_paid = AmountPaid FROM inserted
	
	UPDATE trig.Student 
	SET RemainingAmt = RemainingAmt - @amt_paid
	WHERE StudentID=@s_id
END

--#2

INSERT INTO	trig.FeePayment VALUES(1,1200,'05/06/1974')
INSERT INTO	trig.FeePayment VALUES(1,800,'05/06/1974')
INSERT INTO	trig.FeePayment VALUES(2,800,'05/06/1974')




-------------------
--###
DROP trigger trig.updatingtotalfees
DROP trigger trig.updateremainingfees

UPDATE trig.Student
SET TotalFees=0,RemainingAmt=0

DELETE FROM trig.CourseEnrolled
DELETE FROM trig.FeePayment