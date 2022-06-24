
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
