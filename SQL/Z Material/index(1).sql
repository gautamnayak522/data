SELECT (
	SELECT COUNT(GENDER) 
	FROM student_detail 
	WHERE GENDER='Male') AS BOYS, 
    (
    SELECT COUNT(GENDER) 
    FROM student_detail
    WHERE GENDER='Female') AS GIRLS;
    
SELECT GENDER , (
SELECT SUM(HOURS) 
FROM student_hours sh JOIN student_detail AS sd ON sh.STUDENT_ID=sd.STUDENT_ID AND GENDER='Male'
) AS 'PRESENT(Hrs)'
FROM student_detail
WHERE GENDER='Male'
GROUP BY GENDER
UNION
SELECT GENDER , (
SELECT SUM(HOURS) 
FROM student_hours sh JOIN student_detail AS sd ON sh.STUDENT_ID=sd.STUDENT_ID AND GENDER='Female'
) AS 'PRESENT(Hrs)'
FROM student_detail
WHERE GENDER='Female'
GROUP BY GENDER;


SELECT NAME,pp.PRODUCT_ID,EFFDT,CODE,PRICE FROM product_price AS pp JOIN product AS p ON p.PRODUCT_ID=pp.PRODUCT_ID
GROUP BY pp.PRODUCT_ID,CODE
ORDER BY EFFDT DESC



