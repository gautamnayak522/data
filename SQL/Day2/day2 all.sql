use AdventureWorks2019

select * from Person.EmailAddress


UPDATE Person.EmailAddress 
SET EmailAddress='Not Available';


SELECT * FROM HumanResources.Employee;

use AdventureWorksDW2019

select * from DimEmployee

UPDATE DimEmployee
SET EmailAddress='Not Available';

UPDATE DimEmployee
SET EmailAddress='Not Available',BaseRate=0.10;

UPDATE DimEmployee
SET EmailAddress='Not Available',BaseRate=0.10 
where EmployeeKey=1 ;

UPDATE DimEmployee
SET EmailAddress='Not Available'
where DepartmentName='marketing' and BaseRate<20 ;

UPDATE DimEmployee
SET EmailAddress='Not Available'
where DepartmentName='Production';

UPDATE DimEmployee
SET VacationHours=50
where VacationHours<=20;




