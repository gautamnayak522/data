select * from exp.Student


insert into TestDatas2(Id,address) values (5,'bbbb')


create schema exp


create table exp.Student(
	Id int primary key,
	Name varchar(50),
	Address varchar(50)
);

use AdventureWorks2019
select * from HumanResources.Employee


--Write a SQL statement to create a table named countries including columns CountryId, CountryName and RegionId and
--make sure that no countries except Italy, India and China will be entered in the table. 
--and combination of columns CountryId and RegionId will be unique.

CREATE TABLE countries(
	CountryId int NOT NULL,
	CountryName varchar(40),
	RegionId int NOT NULL,
	constraint uc_countries UNIQUE(CountryId,RegionId)
);

ALTER TABLE countries
ADD CONSTRAINT CHK_contryname CHECK (CountryName='italy' OR CountryName='india' OR CountryName='china');

select * from countries;

insert into countries values(3,'italy',5)

Drop table countries;

Delete from countries;

ALTER TABLE countries Add Code int;
ALTER TABLE countries Drop column Code;

--ALTER TABLE countries modify CountryName varchar(50) NOT NULL;


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



select format (getDate(),'dd/MM/yyyy')as date;

create table JobHistory (
EmployeeId int primary key,
StartDate varchar(200) NOT NULL,
End_date varchar(200) NOT NULL ,
Job_id int NOT NULL,
DepartmentId int NOT NULL,
--constraint CHK_date CHECK (StartDate like '[0-3][0-9]/[0-1][0-9]/[1-2][0-9][0-9][0-9]' AND End_date like '([0-2][0-9]|(3)[0-1])[/](((0)[0-9])|((1)[0-2]))[/]\d{4}')
constraint CHK_date CHECK (StartDate like '[0-3][0-9]/[0-1][0-9]/[1-2][0-9][0-9][0-9]' AND End_date like '[0-3][0-9]/[0-1][0-9]/[1-2][0-9][0-9][0-9]' )
);

--constraint CHK_contryname CHECK (CountryName='italy' OR CountryName='india' OR CountryName='china')

Drop table jobhistory;

select * from jobHistory;

insert into jobhistory values (7,'05/06/1974','05/06/1947',2,2)


select * from exp.Student


create table jobs(
	JobId int NOT NULL,
	JobTitle varchar(50) DEFAULT '',
	MinSalary int DEFAULT 8000,
	MaxSalary int DEFAULT NULL
);

select * from jobs

insert into jobs(JobId) values (1);
insert into jobs(JobId,JobTitle) values (1,'SW');
insert into jobs(JobId,JobTitle,MinSalary) values (1,'SW',4000);
insert into jobs(JobId,JobTitle,MinSalary,MaxSalary) values (1,'SW',4000,17000);


CREATE TABLE Employees(
	Employee_id int primary key,
	FirstName varchar(50),
	LastName varchar(50),
	Email varchar(50)
);


--JOBS TABLE

CREATE TABLE jobs(
	JobId int primary key,
	JobTitle varchar(50) DEFAULT '',
	MinSalary int DEFAULT 8000,
	MaxSalary int DEFAULT NULL
);

INSERT INTO jobs(JobId,JobTitle,MinSalary,MaxSalary) VALUES (1,'Software Engineer',40000,70000);
INSERT INTO jobs(JobId,JobTitle,MinSalary,MaxSalary) VALUES (2,'Sr.Software Engineer',70000,90000);

SELECT * FROM Jobs;


-- DEPARTMENT TABLE

CREATE TABLE department(
DeptId int primary key,
DeptName varchar(50) NOT NULL
);

SELECT * FROM department;

insert into department values (1,'DotNet');
insert into department values (2,'PHP');
insert into department values (3,'QA');


-- EMPLOYEE TABLE


CREATE TABLE Employees (
	Employee_Id int primary key,
	FirstName varchar(50),
	LastName varchar(50),
	Email varchar(50),
	PhoneNumber varchar(50),
	Hire_Date varchar(50),
	Job_Id int FOREIGN KEY REFERENCES Jobs(JobId),
	Salary int,
	Commission int,
	Manager_Id int,
	Department_Id int FOREIGN KEY REFERENCES department(DeptId)
);

SELECT * FROM Employees;

INSERT INTO Employees VALUES (1,'abc','XYZ','ABC@GMAIL.COM','1111111111','11/11/2015',1,55000,5000,2,1);
INSERT INTO Employees VALUES (6,'abc','XYZ','ABC@GMAIL.COM','1111111111','11/11/2015',2,55000,5000,2,3);

SELECT TOP 1 * FROM Employees order by Employee_id desc;


SELECT CONCAT(11,33,99) AS Result

CREATE TABLE PhoneNumbers (ClientName VARCHAR(100),AreaCode INT , PhoneNumber BIGINT,Dt DATETIME)
 
INSERT INTO PhoneNumbers VALUES('Name-1',301,2929420,GETDATE())
INSERT INTO PhoneNumbers VALUES('Name-1',925,5781725,GETDATE())
INSERT INTO PhoneNumbers VALUES('Name-3',207,3188796,GETDATE())

select * from PhoneNumbers







