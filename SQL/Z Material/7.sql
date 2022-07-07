--> Q-1 Write a query which will output 123,456.78(as string datatype) for the input value of 123456.77912.
SELECT  STUFF(LEFT(CONVERT(varchar(30) , ROUND(123456.77912,2)),9), 4, 0,',') AS Output;

--> Q-2 Write a query to find position of letter 'd' in the string 'abcdefgh'.
SELECT CHARINDEX('d', 'abcdefgh') AS Output;

--> Q-3 Write a query which will output "hello world" for input string "Hello World".
SELECT LOWER('Hello World') AS Output;

--> Q-4 Write a query to find 3 characters from the left of any given string.
SELECT LEFT('Hello World', 3) AS Output;

--> Q-5 Write a query to find 3 characters from the right of any given string.
SELECT RIGHT('Hello World', 3) AS Output;

--> Q-6 Write a query which will return length of any given string.
SELECT LEN('Hello World') AS Output;

--> Q-7 Write a query which will output "------abcd" for input string "abcd".
SELECT RIGHT('----------' + 'abcd', 10) AS Output;

--> Q-8 Write a query which will output "abcd......" for input string "abcd".
SELECT LEFT('abcd' + '..........', 10) AS Output;

--> Q-9 Write a query which will output "abcd  " for input string "  abcd  ".
SELECT LTRIM('	abcd  ') AS Output;

--> Q-10 Write a query which will output "  abcd" for input string "  abcd  ".
SELECT RTRIM('	abcd  ') AS Output;

--> Q-11 Write a query which will output "is" for input string "The weather is very nice.".
SELECT SUBSTRING('The weather is very nice.', 13, 2) AS Output;

--> Q-12 Write a query which will output "hellohellohello" for input string "hello".
SELECT REPLICATE('hello', 3) AS Output;

--> Q-13 Write a query which will output ".ecin yrev si rehtaew ehT" for input string "The weather is very nice.".
SELECT REVERSE('The weather is very nice.') AS Output;

--> Q-14 Explain the use of function SOUNDEX().
SELECT SOUNDEX('Plan'), SOUNDEX('Plain'), SOUNDEX('Plane');
SELECT SOUNDEX('Cane'), SOUNDEX('Plane');

--> Q-15 Write a query which will output "is very nice." for input string "The weather is very nice.".
SELECT SUBSTRING('The weather is very nice.', 13, 40) AS Output;

--> Q-16 Explain the use of TRIM function.
SELECT TRIM('	abcd  ') AS Output;
-- Trim function is basically used to trim the white spaces from both left and right side.