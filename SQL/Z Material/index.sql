USE extraassignment;

SELECT NAME,
CASE
    WHEN PRESENT <=7 THEN "Poor"
    WHEN PRESENT>7 AND PRESENT<=15 THEN "Good"
     WHEN PRESENT>15 AND PRESENT<=20 THEN "Better"
    ELSE "Best"
END AS 'Attendence Report'
FROM student AS s JOIN student_present AS sp ON 
	s.STUDENT_ID=sp.STUDENT_ID AND 
	sp.MONTH = MONTH(CURDATE());
    
    
    INSERT INTO student_hours values
    (NULL,1,'2022-01-02',6),
	(NULL,1,'2022-01-03',7),  
	(NULL,1,'2022-01-04',5),
	(NULL,2,'2022-01-02',6),   
	(NULL,2,'2022-01-03',4),
	(NULL,2,'2022-01-04',8),
	(NULL,3,'2022-01-02',2),
	(NULL,3,'2022-01-03',4),
	(NULL,3,'2022-01-04',5),
	(NULL,1,'2022-02-02',6),
	(NULL,1,'2022-02-03',2),  
	(NULL,1,'2022-02-04',9),
	(NULL,2,'2022-02-02',3),   
	(NULL,2,'2022-02-03',4),
	(NULL,2,'2022-02-04',6),
	(NULL,3,'2022-02-02',1),
	(NULL,3,'2022-02-03',3),
	(NULL,3,'2022-02-04',7);


SELECT NAME 
,(SELECT SUM(HOURS) FROM student_hours WHERE MONTH(DATE)=1 AND STUDENT_ID=s.STUDENT_ID) AS 'JAN'
,(SELECT SUM(HOURS) FROM student_hours WHERE MONTH(DATE)=2 AND STUDENT_ID=s.STUDENT_ID) AS 'FEB'
,(SELECT SUM(HOURS) FROM student_hours WHERE MONTH(DATE)=3 AND STUDENT_ID=s.STUDENT_ID) AS 'MARCH'
FROM student AS s JOIN student_hours AS sh ON s.STUDENT_ID=sh.STUDENT_ID
GROUP BY NAME;

INSERT INTO student VALUES
(NULL,'Mira'),
(NULL,'Kabir'),
(NULL,'Om'),
(NULL,'Manas');

INSERT INTO student_detail VALUES
(NULL,4,'6','Female'),
(NULL,5,'8','Male'),
(NULL,6,'8','Male'),
(NULL,7,'5','Male');

SELECT NAME,STANDARD
FROM student AS s JOIN student_detail AS sd ON 
	s.STUDENT_ID= sd.STUDENT_ID AND 
	NAME IN ("Mira", "Kabir", "Om", "Manas");

SELECT NAME,STANDARD
FROM student AS s JOIN student_detail AS sd ON 
	s.STUDENT_ID= sd.STUDENT_ID AND 
	NAME NOT IN ("Mira", "Kabir", "Om", "Manas");

    INSERT INTO student_hours values
    (NULL,1,'2022-01-23',6),
	(NULL,5,'2022-01-21',7),  
	(NULL,5,'2022-01-24',6),
	(NULL,6,'2022-01-22',8),   
	(NULL,7,'2022-01-22',7);

SELECT NAME ,STANDARD,PRESENT
FROM student AS s JOIN student_hours AS sh ON s.STUDENT_ID=sh.STUDENT_ID
AND DAY(sh.DATE) BETWEEN 20 AND 25
JOIN student_detail AS sd ON sh.STUDENT_ID=sd.STUDENT_ID
LEFT JOIN student_present AS sp ON sh.STUDENT_ID=sp.STUDENT_ID AND MONTH=1
GROUP BY NAME;

SELECT NAME,STANDARD
FROM student AS s JOIN student_detail AS sd ON s.STUDENT_ID=sd.STUDENT_ID AND NAME LIKE '__r%'

SELECT NAME,STANDARD
FROM student AS s JOIN student_detail AS sd ON s.STUDENT_ID=sd.STUDENT_ID AND NAME LIKE '%bhai%';

SELECT NAME,STANDARD
FROM student AS s JOIN student_detail AS sd ON s.STUDENT_ID=sd.STUDENT_ID 
LEFT JOIN student_present AS sp ON s.STUDENT_ID=sp.STUDENT_ID 
WHERE sp.STUDENT_ID IS NULL
GROUP BY NAME;

SELECT NAME ,IF(
(SELECT PRESENT 
FROM student_present 
WHERE MONTH=MONTH(CURDATE()) AND STUDENT_ID=s.STUDENT_ID)
,"Present","Not Present") AS 'Attendence Report'
FROM student AS s LEFT JOIN student_present AS sp ON s.STUDENT_ID=sp.STUDENT_ID 
GROUP BY NAME;

	SELECT STRCMP('text', 'text2');
	SELECT STRCMP('text2', 'text');
	SELECT STRCMP('text', 'text');


SELECT NAME, STANDARD ,PRESENT
FROM student AS s JOIN student_detail AS sd ON s.STUDENT_ID=sd.STUDENT_ID
JOIN  student_present AS sp ON sd.STUDENT_ID=sp.STUDENT_ID 
WHERE s.STUDENT_ID IN(
SELECT STUDENT_ID FROM student_present
WHERE  MONTH IN (1,2,3) 
HAVING AVG(PRESENT) BETWEEN 60 AND 75
 )
 GROUP BY NAME;

SELECT * FROM product_price
WHERE PRICE=(SELECT MAX(PRICE) FROM product_price
WHERE EFFDT BETWEEN '2022-06-20' AND '2022-06-25') 
 

