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