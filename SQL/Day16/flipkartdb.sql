CREATE DATABASE ProjDB
USE projDB

CREATE TABLE Customer (
    CustomerID INT  NOT NULL ,
    First_Name VARCHAR(50)  NOT NULL ,
    Last_Name VARCHAR(50)  NOT NULL ,
    Mobile_no VARCHAR(15)  NOT NULL ,
    Email VARCHAR(50)  NOT NULL ,
    Address1 VARCHAR(50)  NOT NULL ,
    Address2 VARCHAR(50)  NULL ,
    Gender INT  NOT NULL ,
    Password VARCHAR(32)  NOT NULL ,
    created_at DATETIME  NOT NULL ,
    modified_at DATETIME  NOT NULL ,
    CONSTRAINT PK_Customer PRIMARY KEY CLUSTERED (CustomerID ASC),
	CONSTRAINT FK_Customer_Gender FOREIGN KEY(Gender) REFERENCES Objects(Obj_ID)
)

CREATE TABLE Product (
    ProductID INT  NOT NULL ,
    Cat_ID INT  NOT NULL ,
    DiscountID INT  NOT NULL ,
    Name VARCHAR(50)  NOT NULL ,
    Price INT  NOT NULL ,
    Quantity INT  NOT NULL ,
    created_at DATETIME  NOT NULL ,
    modified_at DATETIME  NOT NULL ,
    CONSTRAINT PK_Product PRIMARY KEY CLUSTERED (ProductID ASC),
    CONSTRAINT UK_Product_Name UNIQUE( Name ),
	CONSTRAINT FK_Product_Cat_ID FOREIGN KEY(Cat_ID) REFERENCES Categories (Cat_Id),
	CONSTRAINT FK_Discount_DiscountID FOREIGN KEY(DiscountID)REFERENCES Discount (DiscountID)
)

CREATE TABLE Discount (
    DiscountID INT  NOT NULL ,
    Name VARCHAR(50)  NOT NULL ,
    DESCRIPTION VARCHAR(50)  NULL ,
    DISC_PERCT FLOAT  NOT NULL ,
    created_at DATETIME  NOT NULL ,
    modified_at DATETIME  NOT NULL ,
    CONSTRAINT PK_Discount PRIMARY KEY CLUSTERED (DiscountID ASC)
)

CREATE TABLE Categories (
    Cat_Id INT  NOT NULL ,
    Name VARCHAR(50)  NOT NULL ,
    created_at DATETIME  NOT NULL ,
    modified_at DATETIME  NOT NULL ,
    CONSTRAINT PK_Categories PRIMARY KEY CLUSTERED (Cat_Id ASC)
)

CREATE TABLE Feedback (
    CustomerID INT  NOT NULL ,
    ProductID INT  NOT NULL ,
    Rating INT  NOT NULL ,
    Message VARCHAR(50)  NULL ,
    created_at DATETIME  NOT NULL ,
    modified_at DATETIME  NOT NULL ,
	CONSTRAINT FK_Feedback_ProductID FOREIGN KEY(ProductID)REFERENCES Product (ProductID),
	CONSTRAINT FK_Feedback_CustomerID FOREIGN KEY(CustomerID)REFERENCES Customer (CustomerID)
)

CREATE TABLE Orders (
    OrderID INT  NOT NULL ,
    CustomerID INT  NOT NULL ,
    TotalAmount INT  NOT NULL ,
    OrderStatusID int  NOT NULL ,
    Date DATETIME  NOT NULL DEFAULT (getdate()),
    created_at DATETIME  NOT NULL DEFAULT (getdate()) ,
    modified_at DATETIME  NOT NULL DEFAULT (getdate()),
    CONSTRAINT PK_Order PRIMARY KEY CLUSTERED (OrderID ASC),
	CONSTRAINT FK_Order_OrderStatusID FOREIGN KEY(OrderStatusID) REFERENCES Objects(Obj_ID),
	CONSTRAINT FK_Order_CustomerID FOREIGN KEY(CustomerID)REFERENCES Customer (CustomerID)
)

CREATE TABLE OrderLine (
    OrderLineID int  NOT NULL ,
    OrderID int  NOT NULL ,
    ProductID int  NOT NULL ,
    Quantity int  NOT NULL ,
    created_at DATETIME  NOT NULL ,
    modified_at DATETIME  NOT NULL ,
    CONSTRAINT PK_OrderLine PRIMARY KEY CLUSTERED (OrderLineID ASC),
	CONSTRAINT FK_OrderLine_OrderID FOREIGN KEY(OrderID)REFERENCES Orders (OrderID),
	CONSTRAINT FK_OrderLine_ProductID FOREIGN KEY(ProductID)REFERENCES Product (ProductID)
)

CREATE TABLE Payment (
    PaymentID INT  NOT NULL ,
	OrderID INT  NOT NULL ,
    Amount INT  NOT NULL ,
    Pay_Method INT  NOT NULL ,
    created_at DATETIME  NOT NULL ,
    modified_at DATETIME  NOT NULL ,
    CONSTRAINT PK_Payment PRIMARY KEY CLUSTERED (PaymentID ASC),
	CONSTRAINT FK_Payment_Pay_Method FOREIGN KEY(Pay_Method)REFERENCES Objects (Obj_ID),
	CONSTRAINT FK_Order_ID FOREIGN KEY(OrderID)REFERENCES Orders(OrderID)
)

CREATE TABLE Types (
    Type_ID INT  NOT NULL ,
    Name VARCHAR(50)  NOT NULL ,
    created_at DATETIME  NOT NULL ,
    modified_at DATETIME  NOT NULL ,
    CONSTRAINT PK_Types PRIMARY KEY CLUSTERED (Type_ID ASC)
)

CREATE TABLE Objects (
    Obj_ID INT  NOT NULL,
    Type_ID INT  NOT NULL,
    Value VARCHAR(15)  NOT NULL ,
    created_at DATETIME  NOT NULL ,
    modified_at DATETIME  NOT NULL ,
    CONSTRAINT PK_Objects PRIMARY KEY CLUSTERED (Obj_ID ASC),
	CONSTRAINT FK_Objects_Type_ID FOREIGN KEY(Type_ID)REFERENCES Types(Type_ID)
)

