USE myDB

CREATE TABLE Manager(
	ManagerId int primary key,
	ManagerName varchar(50)
)

INSERT INTO Manager VALUES(1,'Tom')
INSERT INTO Manager VALUES(2,'Jack')
INSERT INTO Manager VALUES(3,'Oggy')
INSERT INTO Manager VALUES(4,'Obama')

SELECT * FROM Manager

CREATE TABLE Employees(
	Employee_Id int primary key,
	FirstName varchar(50) NOT NULL,
	LastName varchar(50) NOT NULL,
	Salary int NOT NULL,
	JoiningDate varchar(50) NOT NULL,
	Department varchar(50) NOT NULL,
	ManagerId int,
	CONSTRAINT FK_ManagerId FOREIGN KEY (ManagerId)
	REFERENCES Manager(ManagerId)
);

--INSERT INTO Employees VALUES (1,'John','Abraham',1000000,'01-JAN-13 12.00.00 AM','Banking',NULL)
--INSERT INTO Employees VALUES (1,'John','Abraham',1000000,convert(varchar, getdate(), 0),'Banking',NULL)

INSERT INTO Employees VALUES (1,'John','Abraham',1000000,convert(varchar,'01-JAN-13 12.00.00 AM', 0),'Banking',NULL)
INSERT INTO Employees VALUES (2,'Michael','Clarke',800000,convert(varchar,'01-JAN-13 12.00.00 AM', 0),'Insurance',1)
INSERT INTO Employees VALUES (3,'Roy','Thomas',700000,convert(varchar,'01-FEB-13 12.00.00 AM', 0),'Banking',1)
INSERT INTO Employees VALUES (4,'Tom','Jose',600000,convert(varchar,'01-FEB-13 12.00.00 AM', 0),'Insurance',2)
INSERT INTO Employees VALUES (5,'Jerry','Pinto',650000,convert(varchar,'01-FEB-13 12.00.00 AM', 0),'Insurance',3)
INSERT INTO Employees VALUES (6,'Philip','Mathew',750000,convert(varchar,'01-JAN-13 12.00.00 AM', 0),'Services',3)
INSERT INTO Employees VALUES (7,'TestName1','123',650000,convert(varchar,'01-JAN-13 12.00.00 AM', 0),'Services',2)
INSERT INTO Employees VALUES (8,'TestName2','Lname%',600000,convert(varchar,'01-FEB-13 12.00.00 AM', 0),'Insurance',2)
INSERT INTO Employees VALUES (9,'TestName2','Lname%',600000,'01-FEB-13 12.00.00 AM','Insurance',2)

SELECT * FROM Employees
--DROP TABLE Employees

CREATE TABLE Incentives
(
	Employee_ref_id int,
	INCENTIVE_DATE varchar(50) NOT NULL,
	INCENTIVE_AMOUNT int NOT NULL,
	CONSTRAINT FK_Employee_id FOREIGN KEY(Employee_ref_id) 
	REFERENCES Employees(Employee_Id)
)

INSERT INTO Incentives VALUES(1,'1-FEB-13',5000)
INSERT INTO Incentives VALUES(2,'1-FEB-13',3000)
INSERT INTO Incentives VALUES(3,'1-FEB-13',4000)
INSERT INTO Incentives VALUES(1,'1-JAN-13',4500)
INSERT INTO Incentives VALUES(2,'1-JAN-13',3500)

SELECT * FROM Incentives

--DROP TABLE Incentives

SELECT Convert(varchar,INCENTIVE_DATE) FROM Incentives

SELECT CONVERT(varchar,PARSE(INCENTIVE_DATE AS DATETIME),0) FROM Incentives;