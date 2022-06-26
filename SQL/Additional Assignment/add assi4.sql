--Q-1 Write a query which will return value '5.0' for input value of '4.1' as well as '4.8'.

SELECT CAST(CEILING(4.1) AS decimal(2,1)) AS 'Q1.1'
SELECT CAST(CEILING(4.8) AS decimal(2,1)) AS 'Q1.2'

-- Q-2 Write a query which will return value '4.0' for input value of '4.1' as well as '4.8'.

SELECT CAST(FLOOR(4.1) AS decimal(2,1)) AS 'Q2.1'
SELECT CAST(FLOOR(4.8) AS decimal(2,1)) AS 'Q2.2'

-- Q-3 What will be the output of following query:

	SELECT MOD(11,3);
	-->MOD' is not a recognized built-in function name
	SELECT 11 % 3;
	--> 2

--Q-4 Write a query to find 2 raise to power 3.

	SELECT POWER(2,3) AS POWER

--Q-5 Write a query to generate random number using MS SQL function.

	SELECT RAND() AS 'RandomNumber'

--Q-6 Write a query to supply seed to the function generating random number.

	SELECT RAND(6) AS 'RandomNumber'

--Q-7 Write a query which will return value '4' for '3.5' and '3' for '3.4'.

SELECT CAST (ROUND(3.5,0) AS int) AS 'Q7.1'; 
SELECT CAST (ROUND(3.4,0) AS int) AS 'Q7.2'; 

--Q-8 Write a query so that output will be '15.75' for the value '15.7463847'.

SELECT FORMAT(ROUND(15.7463847,2),'N2' ) AS 'Q8'

--Q-9 Write a query to find square root of given value. What will be the output if the provided value is negative?

	SELECT SQRT(9) AS 'Q9.1'; --> 3
	SELECT SQRT(-9) AS 'Q9.2'; --> An invalid floating point operation occurred. 

--Q-10 Write a query so that output will be '15.74' for the value '15.7463847'.

SELECT FORMAT(ROUND(15.7463847,2),'N2' ) AS 'Q10'

--Q-11 Write a query which will output '15.2500' for provided value '15.25'.

	SELECT FORMAT(15.25,'N4' ) AS 'Q11'



