--Self Join
DROP TABLE EMP_MAN

CREATE TABLE EMP_MAN(
	Emp_id int primary key,
	Name varchar(50),
	Age int,
	Address varchar(50),
	Man_id int
);

INSERT INTO EMP_MAN VALUES(1,'AAA',20,'LOCAL',2)
INSERT INTO EMP_MAN VALUES(2,'BBB',20,'LOCAL',3),(3,'CCC',20,'LOCAL',1),(4,'DDD',20,'LOCAL',NULL)

SELECT * FROM EMP_MAN

SELECT e1.Emp_id,e1.Name as 'Emp Name',e1.Man_id,e2.Name as 'Man Name' FROM EMP_MAN e1 FULL JOIN EMP_MAN e2
ON e1.Man_id=e2.Emp_id





