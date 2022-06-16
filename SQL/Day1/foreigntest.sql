
create table department(
DeptId int primary key,
DeptName varchar(50) NOT NULL
);

Create Table Employee(
EmpId int primary key,
EmpName varchar(50) NOT NULL,
DeptId int FOREIGN KEY REFERENCES department(DeptId)
)

insert into department values (3,'Civil');
select * from department

insert into Employee values (1,'Gautam',1);
insert into Employee values (2,'Yash',3);
insert into Employee values (2,'Raj',4);
select * from Employee
