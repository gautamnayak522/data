SELECT CONVERT(date,GETDATE())
SELECT CONVERT(datetime,GETDATE())
SELECT CONVERT(datetime2,GETDATE())
SELECT CONVERT(datetimeoffset,GETDATE())
SELECT CONVERT(smalldatetime,GETDATE())

SELECT CONVERT(varchar,GETDATE(),0)
select convert(varchar, getdate())

select DATEPART(DD,GETDATE())

SELECT CONVERT(varchar,PARSE(INCENTIVE_DATE AS DATETIME),0) FROM Incentives;