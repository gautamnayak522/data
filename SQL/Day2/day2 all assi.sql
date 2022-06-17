use AdventureWorksDW2019

select * from DimEmployee

--pr1
UPDATE DimEmployee
SET EmailAddress='Not Available';

--pr2
UPDATE DimEmployee
SET EmailAddress='Not Available',BaseRate=0.10;

--pr3
UPDATE DimEmployee
SET EmailAddress='Not Available',BaseRate=0.10 
where EmployeeKey=1 ;

--pr4
UPDATE DimEmployee
SET EmailAddress='Not Available'
where DepartmentName='marketing' and BaseRate<20 ;

--pr5
UPDATE DimEmployee
SET EmailAddress='Not Available'
where DepartmentName='Production';

--pr6 Write a SQL statement to change salary of employee to 8000 whose ID is 105, if the existing salary is less than 5000.
UPDATE DimEmployee
SET VacationHours=50
where EmployeeKey=1;




