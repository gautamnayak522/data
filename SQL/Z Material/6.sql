-- use an existing database
USE SqlModuleDB;


/*
Q-1 Print total number of boys and girls within a single record.
	Fields : Boys, Girls

	Required Output:
	================
	Boys	Girls
	5	3
*/
SELECT DISTINCT (SELECT COUNT(gender) FROM student.StudentDetail WHERE gender = 'M') AS Boys,
(SELECT COUNT(gender) FROM student.StudentDetail WHERE gender = 'F') AS Girls
FROM student.StudentDetail;


/*
Q-2 Find total number of Hours for Boys and Girls. 
	Fields : Gender, Present(Hrs)

	Required Output:
	================
	Gender	Present(Hrs)
	Boys	100
	Girls	120
*/
SELECT 
	CASE
		WHEN D.gender = 'M' THEN 'Boys'
		WHEN D.gender = 'F' THEN 'Girls'
		ELSE 'Others'
	END AS Gender, 
	SUM(Hs.HoursSum) AS [Present(Hrs)]
FROM student.StudentDetail D
JOIN student.StudentHoursSum Hs
ON D.studentid = Hs.studentid
GROUP BY D.gender;


/*
Q-3 Find all latest prices for each code for each product.
	Fields : Product Name, Code, Date, Price

	Required Output:
	================
	Product Name	Code	Date		Price
	Computer	COMP	2007-01-01	Rs. 24,000/-
*/
SELECT P.name, Pr.code, Pr.effdt, Pr.price
FROM student.Product P
JOIN student.ProductPrice Pr
ON P.productid = Pr.productid;


-- show all records
SELECT *
FROM student.Student;

SELECT *
FROM student.StudentDetail;

SELECT *
FROM student.StudentPresent;

SELECT *
FROM student.StudentHours;

SELECT *
FROM student.StudentHoursSum;

SELECT *
FROM student.Product;

SELECT *
FROM student.ProductPrice;