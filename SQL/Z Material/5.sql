-- use an existing database
USE SqlModuleDB;


/*
Q-1 Write a query which will print name of each student, and his or her attendance report for current month. 
Fields : Name, Attendance Report for Current Month

	Under "Attendance Report for Current Month" column:
		if 'studentpresent.present' is less than or equal to 7 print "Poor", 
		if 'studentpresent.present' is more than 7 and less than or equals 15 print "Good", 
		if 'studentpresent.present' is more than 15 and less than or equals 20 print "Better", 
		if 'studentpresent.present' is more than 20 print "Best".
*/
SELECT S.name, P.present AS [Attendance Report for Current Month],
CASE 
	WHEN P.present > 20 THEN 'Best'
	WHEN P.present > 15 THEN 'Better'
	WHEN P.present > 7 THEN 'Good'
	ELSE 'Poor'
END AS AttendanceRemark
FROM student.Student S
JOIN student.StudentPresent P
ON S.studentid = P.studentid
WHERE P.month = DATEPART(MM, GETDATE());


/*
Q-2 Write a query to print student name, total number of hours for Jan, Feb, March month. Information for each student should be printed in a single row.

	Fields : Name, Working Hours for Jan, Working Hours for Feb, Working Hours for March

	See following example:
	Name		Working Hours for Jan	Working Hours for Feb	Working Hours for March
	Minesh		80			70			90
	Reena		70			80			90
*/
WITH temp(Name, JulHrs, AugHrs, SepHrs, OctHrs) AS
(SELECT S.name, 
COALESCE((SELECT H.hours WHERE DATEPART(MM, H.date) = 7), 0),
COALESCE((SELECT H.hours WHERE DATEPART(MM, H.date) = 8), 0),
COALESCE((SELECT H.hours WHERE DATEPART(MM, H.date) = 9), 0),
COALESCE((SELECT H.hours WHERE DATEPART(MM, H.date) = 10), 0) 
FROM student.Student S
LEFT JOIN student.StudentHours H
ON S.studentid = H.studentid) 

SELECT Name, 
SUM(JulHrs) AS [Working Hours for Jul], 
SUM(AugHrs) AS [Working Hours for Aug], 
SUM(SepHrs) AS [Working Hours for Sep], 
SUM(OctHrs) AS [Working Hours for Oct]
FROM temp
GROUP BY Name;


--> Q-3 Print information for the student having name like "Mira", "Kabir", "Om", "Manas" -> Fields: Name, Standard
SELECT S.name, D.gender
FROM student.Student S
LEFT JOIN student.StudentDetail D
ON S.studentid = D.studentid
WHERE S.name IN ('Mira', 'Kabir', 'Om', 'Manas');


--> Q-4 Print information for the student having name other than "Mira", "Kabir", "Om", "Manas" -> Fields: Name, Standard
SELECT S.name, D.gender
FROM student.Student S
LEFT JOIN student.StudentDetail D
ON S.studentid = D.studentid
WHERE S.name NOT IN ('Mira', 'Kabir', 'Om', 'Manas');


--> Q-5 Print information for the student having presence for January between 20 to 25. -> Fields: Name, Standard, Present
SELECT S.name, D.gender, P.present
FROM student.Student S
LEFT JOIN student.StudentDetail D ON S.studentid = D.studentid
JOIN student.StudentPresent P ON S.studentid = P.studentid;


--> Q-6 Print information for the student having charcter "r" at the third position of their name.
-- Fields: Name, Standard
-- Eg: It should print information for "Mira", "Gira" etc.
SELECT S.name, D.gender
FROM student.Student S
LEFT JOIN student.StudentDetail D
ON S.studentid = D.studentid
WHERE S.name LIKE '__r%';


--> Q-7 Print information for the student having "bhai" in their name. -> Fields: Name, Standard
SELECT S.name, D.gender
FROM student.Student S
LEFT JOIN student.StudentDetail D
ON S.studentid = D.studentid
WHERE S.name LIKE '%bhai%';


--> Q-8 Print information for the student who do not have any presence in the college. -> Fields: Name, Standard
SELECT temp.name, D.standard FROM
(SELECT S.studentid, S.name, P.PresentSum
FROM student.Student S
LEFT JOIN student.StudentPresentSum P ON S.studentid = P.studentid) temp
LEFT JOIN student.StudentDetail D ON temp.studentid = D.studentid
WHERE PresentSum IS NULL;


/*
Q-9 Write a query which will print name of each student, and his or her attendance report for current month. 
	Fields : Name, Attendance Report for Current Month
	In "Attendance Report for Current Month" column 
	if student has presence for that month then print "Present"
	else print "Not Present".
*/
WITH temp AS
(SELECT S.name, P.present 
FROM student.Student S
LEFT JOIN student.StudentPresent P
ON S.studentid = P.studentid
WHERE P.month = DATEPART(MM, GETDATE()))

SELECT S.name, 
CASE
	WHEN T.present IS NULL THEN 'Not Present'
	ELSE 'Present'
END AS [Attendance Report for Current Month]
FROM student.Student S
LEFT JOIN temp T
ON S.name = T.name;


/*
Q-10 Execute following queries and evaluate the output by giving appropriate reason.
	SELECT STRCMP('text', 'text2');
	SELECT STRCMP('text2', 'text');
	SELECT STRCMP('text', 'text');
*/
SELECT DIFFERENCE('text', 'text2') AS Output;
SELECT DIFFERENCE('text2', 'text') AS Output;
SELECT DIFFERENCE('text', 'text') AS Output;


--> Q-11 Print the student information having average presence (in percentage) for Jan, Feb and March between 60 to 75.
-- Fields: Name, Standard, Present
WITH temp(Name, JulHrs, AugHrs, SepHrs, OctHrs) AS
(SELECT S.name, 
COALESCE((SELECT H.hours WHERE DATEPART(MM, H.date) = 7), 0),
COALESCE((SELECT H.hours WHERE DATEPART(MM, H.date) = 8), 0),
COALESCE((SELECT H.hours WHERE DATEPART(MM, H.date) = 9), 0),
COALESCE((SELECT H.hours WHERE DATEPART(MM, H.date) = 10), 0) 
FROM student.Student S
LEFT JOIN student.StudentHours H
ON S.studentid = H.studentid) 

SELECT Name, 
SUM(JulHrs) AS [Working Hours for Jul], 
SUM(AugHrs) AS [Working Hours for Aug], 
SUM(SepHrs) AS [Working Hours for Sep], 
SUM(OctHrs) AS [Working Hours for Oct],
(SUM(JulHrs) + SUM(AugHrs) + SUM(SepHrs) + SUM(OctHrs))/4 AS AvgHrs
FROM temp
GROUP BY Name
HAVING ((SUM(JulHrs) + SUM(AugHrs) + SUM(SepHrs) + SUM(OctHrs))/4) BETWEEN 60 AND 75;


--> Q-12 List information of the product having "Maximum Price" within date range 01-01-2006 to 15-01-2006
SELECT * FROM (
SELECT P.productid, P.name, Pr.code, Pr.effdt, Pr.price
FROM student.Product P
JOIN student.ProductPrice Pr
ON P.productid = Pr.productid
WHERE Pr.effdt BETWEEN '2022-06-01' AND '2022-06-15' AND Pr.price = MAX(Price)) temp
HAVING price = MAX(price);


-- show all records
SELECT *
FROM student.Student;

SELECT *
FROM student.StudentDetail;

SELECT *
FROM student.StudentPresent;

SELECT *
FROM student.StudentPresentSum;

SELECT *
FROM student.StudentHours;

SELECT *
FROM student.StudentHoursSum;

SELECT *
FROM student.Product;

SELECT *
FROM student.ProductPrice;




