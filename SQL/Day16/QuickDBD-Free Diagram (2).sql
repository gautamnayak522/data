-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/KXZkBz
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


SET XACT_ABORT ON

BEGIN TRANSACTION QUICKDBD

CREATE TABLE [Customer] (
    [CustomerID] INT  NOT NULL ,
    [First_Name] VARCHAR(50)  NOT NULL ,
    [Last_Name] VARCHAR(50)  NOT NULL ,
    [Mobile_no] VARCHAR(15)  NOT NULL ,
    [Email] VARCHAR(50)  NOT NULL ,
    [Address1] VARCHAR(50)  NOT NULL ,
    [Address2] VARCHAR(50)  NULL ,
    [Gender] INT  NOT NULL ,
    [Password] VARCHAR(32)  NOT NULL ,
    [created_at] DATETIME  NOT NULL ,
    [modified_at] DATETIME  NOT NULL ,
    CONSTRAINT [PK_Customer] PRIMARY KEY CLUSTERED (
        [CustomerID] ASC
    )
)

CREATE TABLE [Product] (
    [ProductID] INT  NOT NULL ,
    [Cat_ID] INT  NOT NULL ,
    [DiscountID] INT  NOT NULL ,
    [Name] VARCHAR(50)  NOT NULL ,
    [Price] INT  NOT NULL ,
    [Quantity] INT  NOT NULL ,
    [created_at] DATETIME  NOT NULL ,
    [modified_at] DATETIME  NOT NULL ,
    CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED (
        [ProductID] ASC
    ),
    CONSTRAINT [UK_Product_Name] UNIQUE (
        [Name]
    )
)

CREATE TABLE [Discount] (
    [DiscountID] INT  NOT NULL ,
    [Name] VARCHAR(50)  NOT NULL ,
    [DESCRIPTION] VARCHAR(50)  NULL ,
    [DISC_PERCT] FLOAT  NOT NULL ,
    [created_at] DATETIME  NOT NULL ,
    [modified_at] DATETIME  NOT NULL ,
    CONSTRAINT [PK_Discount] PRIMARY KEY CLUSTERED (
        [DiscountID] ASC
    )
)

CREATE TABLE [Categories] (
    [Cat_Id] INT  NOT NULL ,
    [Name] VARCHAR(50)  NOT NULL ,
    [created_at] DATETIME  NOT NULL ,
    [modified_at] DATETIME  NOT NULL ,
    CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED (
        [Cat_Id] ASC
    )
)

CREATE TABLE [Feedback] (
    [CustomerID] INT  NOT NULL ,
    [ProductID] INT  NOT NULL ,
    [Rating] INT  NOT NULL ,
    [Message] VARCHAR(50)  NULL ,
    [created_at] DATETIME  NOT NULL ,
    [modified_at] DATETIME  NOT NULL 
)

CREATE TABLE [Order] (
    [OrderID] int  NOT NULL ,
    [CustomerID] int  NOT NULL ,
    [TotalAmount] money  NOT NULL ,
    [OrderStatusID] int  NOT NULL ,
    [Date] DATETIME  NOT NULL CONSTRAINT [DF_Order_Date] DEFAULT (getutcdate()),
    [created_at] DATETIME  NOT NULL ,
    [modified_at] DATETIME  NOT NULL ,
    CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED (
        [OrderID] ASC
    )
)

CREATE TABLE [OrderLine] (
    [OrderLineID] int  NOT NULL ,
    [OrderID] int  NOT NULL ,
    [ProductID] int  NOT NULL ,
    [Quantity] int  NOT NULL ,
    [created_at] DATETIME  NOT NULL ,
    [modified_at] DATETIME  NOT NULL ,
    CONSTRAINT [PK_OrderLine] PRIMARY KEY CLUSTERED (
        [OrderLineID] ASC
    )
)

CREATE TABLE [Payment] (
    [PaymentID] INT  NOT NULL ,
    [Amount] INT  NOT NULL ,
    [Pay_Method] INT  NOT NULL ,
    [created_at] DATETIME  NOT NULL ,
    [modified_at] DATETIME  NOT NULL ,
    CONSTRAINT [PK_Payment] PRIMARY KEY CLUSTERED (
        [PaymentID] ASC
    )
)

CREATE TABLE [Types] (
    [Type_ID] INT  NOT NULL ,
    [Name] VARCHAR(50)  NOT NULL ,
    [created_at] DATETIME  NOT NULL ,
    [modified_at] DATETIME  NOT NULL ,
    CONSTRAINT [PK_Types] PRIMARY KEY CLUSTERED (
        [Type_ID] ASC
    )
)

CREATE TABLE [Objects] (
    [Obj_ID] INT  NOT NULL ,
    [Type_ID] INT  NOT NULL ,
    [Value] VARCHAR(15)  NOT NULL ,
    [created_at] DATETIME  NOT NULL ,
    [modified_at] DATETIME  NOT NULL ,
    CONSTRAINT [PK_Objects] PRIMARY KEY CLUSTERED (
        [Obj_ID] ASC
    )
)

ALTER TABLE [Customer] WITH CHECK ADD CONSTRAINT [FK_Customer_Gender] FOREIGN KEY([Gender])
REFERENCES [Objects] ([Obj_ID])

ALTER TABLE [Customer] CHECK CONSTRAINT [FK_Customer_Gender]

ALTER TABLE [Product] WITH CHECK ADD CONSTRAINT [FK_Product_Cat_ID] FOREIGN KEY([Cat_ID])
REFERENCES [Categories] ([Cat_Id])

ALTER TABLE [Product] CHECK CONSTRAINT [FK_Product_Cat_ID]

ALTER TABLE [Discount] WITH CHECK ADD CONSTRAINT [FK_Discount_DiscountID] FOREIGN KEY([DiscountID])
REFERENCES [Product] ([DiscountID])

ALTER TABLE [Discount] CHECK CONSTRAINT [FK_Discount_DiscountID]

ALTER TABLE [Feedback] WITH CHECK ADD CONSTRAINT [FK_Feedback_CustomerID] FOREIGN KEY([CustomerID])
REFERENCES [Customer] ([CustomerID])

ALTER TABLE [Feedback] CHECK CONSTRAINT [FK_Feedback_CustomerID]

ALTER TABLE [Feedback] WITH CHECK ADD CONSTRAINT [FK_Feedback_ProductID] FOREIGN KEY([ProductID])
REFERENCES [Product] ([ProductID])

ALTER TABLE [Feedback] CHECK CONSTRAINT [FK_Feedback_ProductID]

ALTER TABLE [Order] WITH CHECK ADD CONSTRAINT [FK_Order_CustomerID] FOREIGN KEY([CustomerID])
REFERENCES [Customer] ([CustomerID])

ALTER TABLE [Order] CHECK CONSTRAINT [FK_Order_CustomerID]

ALTER TABLE [Order] WITH CHECK ADD CONSTRAINT [FK_Order_OrderStatusID] FOREIGN KEY([OrderStatusID])
REFERENCES [Objects] ([Obj_ID])

ALTER TABLE [Order] CHECK CONSTRAINT [FK_Order_OrderStatusID]

ALTER TABLE [OrderLine] WITH CHECK ADD CONSTRAINT [FK_OrderLine_OrderID] FOREIGN KEY([OrderID])
REFERENCES [Order] ([OrderID])

ALTER TABLE [OrderLine] CHECK CONSTRAINT [FK_OrderLine_OrderID]

ALTER TABLE [OrderLine] WITH CHECK ADD CONSTRAINT [FK_OrderLine_ProductID] FOREIGN KEY([ProductID])
REFERENCES [Product] ([ProductID])

ALTER TABLE [OrderLine] CHECK CONSTRAINT [FK_OrderLine_ProductID]

ALTER TABLE [Payment] WITH CHECK ADD CONSTRAINT [FK_Payment_Amount] FOREIGN KEY([Amount])
REFERENCES [Order] ([TotalAmount])

ALTER TABLE [Payment] CHECK CONSTRAINT [FK_Payment_Amount]

ALTER TABLE [Payment] WITH CHECK ADD CONSTRAINT [FK_Payment_Pay_Method] FOREIGN KEY([Pay_Method])
REFERENCES [Objects] ([Obj_ID])

ALTER TABLE [Payment] CHECK CONSTRAINT [FK_Payment_Pay_Method]

ALTER TABLE [Objects] WITH CHECK ADD CONSTRAINT [FK_Objects_Type_ID] FOREIGN KEY([Type_ID])
REFERENCES [Types] ([Type_ID])

ALTER TABLE [Objects] CHECK CONSTRAINT [FK_Objects_Type_ID]

COMMIT TRANSACTION QUICKDBD