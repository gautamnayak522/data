SELECT * FROM Student
SELECT * FROM studentdetail
SELECT * FROM studentpresent
SELECT * FROM studenthours

SELECT * FROM Product
SELECT * FROM productprice


--Q1

SELECT * FROM Student
SELECT * FROM studentpresent

SELECT s.name,sp.present,
	CASE WHEN sp.present<=7 THEN 'POOR'
		WHEN sp.present>7 AND sp.present<=15 THEN 'Good'
		WHEN sp.present>15 AND sp.present<=20 THEN 'Better'
		WHEN sp.present>20 THEN 'Best'
		END
	AS 'REPORT'
FROM Student s
JOIN studentpresent sp
ON s.studentid=sp.studentid
--WHERE sp.month = DATEPART(MONTH,GETDATE())
--entries in table are january to may 
WHERE sp.month = 1

SELECT DATEPART(MONTH,GETDATE())

--Q2
SELECT * FROM Student
SELECT * FROM studenthours

SELECT s.name,SUM(sh.hours) AS 'TOTAL HOURS IN JAN,FEB,MARCH' FROM
Student s JOIN studenthours sh
ON s.studentid =sh.studentid
WHERE DATEPART(month,datex) IN (1,2,3)
GROUP by s.name


SELECT s.name, SUM(sh.hours) AS 'TOTAL HOURS IN JAN,FEB,MARCH' FROM
Student s JOIN studenthours sh
ON s.studentid =sh.studentid
WHERE DATEPART(month,datex) IN (1,2,3)
GROUP by s.name


---

SELECT studentid,SUM(hours) FROM studenthours
GROUP BY studentid


--Q3





