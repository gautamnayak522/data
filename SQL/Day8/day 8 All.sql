--> assignment 1

--Using the SSMS interface, what steps would you use to create a new clustered index on the 
--name column for the AdventureWorks database?

-- ## USING SSMS
-->DB->Tables->TABLE_NAME->Index->
--> right click new index, clusterd index, select column on which you want to create index

--> There is only one clusterd index in single table, so if there clustered inded is available you can't create another 

--## USING QUERY

SELECT * FROM CUST

--NON CLUSTER,NON UNIQUE
CREATE INDEX IX_JOB_TITLE
ON CUST(JOB_TITLE)

--CLUSTER
CREATE CLUSTERED INDEX IX_JOB_TITLE
ON CUST(JOB_TITLE)

--NON-CLUSTER,UNIQUE
CREATE UNIQUE INDEX IX_JOB_TITLE
ON CUST(JOB_TITLE)


--> Assi 2

CREATE TABLE PlanetsID
(
	ID int NOT NULL,
	ITEM int NOT NULL,
	Value int NOT NULL
)

INSERT INTO PlanetsID VALUES (4, 23, 66)
INSERT INTO PlanetsID VALUES (1, 12, 59)
INSERT INTO PlanetsID VALUES (3, 66, 24)

SELECT * FROM PlanetsID

--  create a clustered index based on the ID column

CREATE CLUSTERED INDEX IX_ID_Planets
ON PlanetsID(ID)

--CREATED CLUSTERED INDEX IN PlanetsID ON ID Column
