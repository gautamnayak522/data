--Ranking Functions
SELECT * FROM Employees

SELECT ROW_NUMBER()

CREATE TABLE Member  
(  
  Id INT PRIMARY KEY,  
  Name VARCHAR(25),  
  Point INT  
)  
INSERT INTO Member VALUES (1,'Sachin', 978)  
INSERT INTO Member VALUES (2,'Rahul', 773)  
INSERT INTO Member VALUES (3,'Kamplesh', 1141)  
INSERT INTO Member VALUES (4,'Chirag', 773)  
INSERT INTO Member VALUES (5,'Pratik', 1242)  
INSERT INTO Member VALUES (6,'Rajesh', 1141)  
INSERT INTO Member VALUES (7,'Anil', 886) 

SELECT * FROM Member

SELECT ROW_NUMBER() OVER( ORDER BY Name) AS SrNo, Name FROM Member  

SELECT ROW_NUMBER() OVER( PARTITION BY Point ORDER BY Point desc) AS [Rank]
, Name, Point FROM Member  

SELECT RANK() OVER( ORDER BY Point desc) AS [Rank], Name, Point FROM Member  

select * from (  
SELECT RANK() OVER( ORDER BY Point desc) AS [Rank], Name, Point FROM Member  
) as tmp where tmp.[Rank] = 2 

--  DENSE_RANK()
SELECT DENSE_RANK() OVER( ORDER BY Point desc) AS [Rank], Name, Point FROM Member  

SELECT NTILE(2) OVER( ORDER BY Point desc) AS [Rank], Name, Point FROM Member  

SELECT Name, Point  
, ROW_NUMBER() OVER(ORDER BY Point desc) AS [ROW_NUMBER]  
, RANK() OVER( ORDER BY Point desc) AS [RANK]  
, DENSE_RANK() OVER( ORDER BY Point desc) AS [DENSE_RANK]  
FROM Member  


SELECT * FROM Employees2

SELECT * FROM 
(
select First_Name,SALARY, DENSE_RANK() OVER(ORDER BY SALARY DESC) RANK
FROM Employees2
)TMP
WHERE RANK = 2



WITH MYTAST
AS
(
	select First_Name,SALARY, DENSE_RANK() OVER(ORDER BY SALARY DESC) RANK
FROM Employees2
)
select * from MYTAST where RANK=2


