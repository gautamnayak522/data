-- Table Structre for Student_Details

CREATE TABLE Student_Details
(
	Id int IDENTITY(1,1) primary key,
	Name varchar(50) NOT NULL,
	Standard int NOT NULL,
	Sex varchar(10),
	Monthly_Present int,
	Daily_Hours int,
	CONSTRAINT CHK_SEX CHECK(Sex IN('male','female')),
	CONSTRAINT CHK_Present CHECK(Monthly_Present<=31),
	CONSTRAINT CHK_Hours CHECK(Daily_Hours<=24)
)

-- Dumping data for table Student_Details

INSERT INTO Student_Details VALUES ('AAA',5,'male',24,14)
INSERT INTO Student_Details VALUES ('BBB',8,'male',28,12)
INSERT INTO Student_Details VALUES ('CCC',6,'female',20,20)

SELECT * FROM Student_Details;


-- Table Structre for Products

CREATE TABLE Products(
	Id int IDENTITY(1,1) primary key,
	Name varchar(50) NOT NULL,
	Price int NOT NULL
);

-- Dumping data for table Products

INSERT INTO Products VALUES ('Mobile',8000)
INSERT INTO Products VALUES ('Laptop',80000)
INSERT INTO Products VALUES ('Charger',600)

SELECT * FROM Products;


-- Table Structre for Materials

CREATE TABLE Materials(
	Id int IDENTITY(1,1) primary key,
	Name varchar(50) NOT NULL,
	Price varchar(50),
	CONSTRAINT CHK_PRICE CHECK(Price Like('Rs.%')),
);

-- Dumping data for table Materials

INSERT INTO Materials VALUES ('Plastic','Rs.1500')
INSERT INTO Materials VALUES ('Cooton','Rs.400')
INSERT INTO Materials VALUES ('Roll','Rs.600')

SELECT * FROM Materials


--DELETE AND TRUNCATE TABLES

DELETE FROM Products Where Id=1
DELETE FROM Products
TRUNCATE TABLE Products

DELETE FROM Student_Details
TRUNCATE TABLE Student_Details

DELETE FROM Materials
TRUNCATE TABLE Materials

-- DROP TABLES

DROP TABLE Student_Details
DROP TABLE Products
DROP TABLE Materials
