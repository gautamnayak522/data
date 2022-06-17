select format (getDate(),'dd/MM/yyyy')as date;

create table JobHistory (
EmployeeId int primary key,
StartDate varchar(200) NOT NULL,
End_date varchar(200) NOT NULL ,
Job_id int NOT NULL,
DepartmentId int NOT NULL,
--constraint CHK_date CHECK (StartDate like '[0-3][0-9]/[0-1][0-9]/[1-2][0-9][0-9][0-9]' AND End_date like '([0-2][0-9]|(3)[0-1])[/](((0)[0-9])|((1)[0-2]))[/]\d{4}')
constraint CHK_date CHECK (StartDate like '[0-3][0-9]/[0-2][0-9]/[1-2][0-9][0-9][0-9]' AND End_date like '[0-3][0-9]/[0-2][0-9]/[1-2][0-9][0-9][0-9]' )
);


insert into jobhistory values (8,'05/06/1974','05/06/1947',2,2)
select * from jobHistory;

select CONCAT (EmployeeId , Job_id) as Result from jobHistory

