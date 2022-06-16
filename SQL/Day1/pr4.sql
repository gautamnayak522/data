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