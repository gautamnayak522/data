CREATE SCHEMA CARS;
GO
CREATE TABLE CARS.Employees (
	Employee_Id int primary key,
	FirstName varchar(50) NOT NULL,
	LastName varchar(50) NOT NULL,
	Email varchar(50) NOT NULL,
	PhoneNumber varchar(50) NOT NULL,
	Hire_Date varchar(50) NOT NULL,
	Salary int NOT NULL,
	Commission int NOT NULL
);
GO
SELECT * FROM CARS.Employees

INSERT INTO CARS.Employees VALUES (1,'abc','xyz','ABC@GMAIL.COM','1111111111','11/11/2015',55000,10);
INSERT INTO CARS.Employees VALUES (2,'mno','pqr','MNO@GMAIL.COM','1111111111','12/12/2022',30000,8);

CREATE TABLE CARS.CARS(
Car_id int primary key,
Car_name varchar(50) NOT NULL,
Model varchar(50) NOT NULL,
Released_year int NOT NULL,
Price int NOT NULL,
);
GO

insert into CARS.CARS VALUES(1,'Ferrari','ECE2',2002,80000000)
insert into CARS.CARS VALUES(2,'Scorpio','M2',1999,12000000)

SELECT * FROM CARS.CARS


CREATE TABLE CARS.INVENTORY(
	Car_id int FOREIGN KEY REFERENCES CARS.CARS(Car_id),
	Quantity int NOT NULL
)
GO

INSERT INTO CARS.INVENTORY VALUES (1,50)
INSERT INTO CARS.INVENTORY VALUES (2,10)

SELECT * from CARS.INVENTORY

CREATE TABLE CARS.SALES(
	sales_id int primary key,
	Car_id int FOREIGN KEY REFERENCES CARS.CARS(Car_id),
	Employee_Id int FOREIGN KEY REFERENCES CARS.Employees(Employee_id),
	sales_quantity int NOT NULL,
	Sales_date date DEFAULT GETDATE()
);
GO

Insert into CARS.SALES (sales_id,Car_id,Employee_Id,sales_quantity)VALUES(1,1,1,1)
SELECT * FROM CARS.SALES