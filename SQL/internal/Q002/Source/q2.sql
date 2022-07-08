SELECT * FROM Product
SELECT * FROM Users
SELECT * FROM Orders
SELECT * FROM Discount
SELECT * FROM OrderItem


-- #1 Find out the product details for which no order is place as of now.

CREATE VIEW VW_PRODUCT_WITH_NO_ORDER
AS
SELECT ProductID,Name FROM Product
WHERE ProductID NOT IN(
SELECT DISTINCT(ProductID) FROM OrderItem
)

SELECT * FROM VW_PRODUCT_WITH_NO_ORDER

--#2 Find out that products on which there is no discount today

CREATE VIEW VW_PRODUCT_WITH_TODAY_DISCOUNT
AS
SELECT d.ProductID,p.Name
FROM Discount d JOIN Product P
ON p.ProductId = d.ProductId
WHERE GETDATE() BETWEEN d.DateStart AND d.DateEnd

SELECT * FROM VW_PRODUCT_WITH_TODAY_DISCOUNT


--#3 Find out the list of the product which are created in last 2 days and it is inStock.

SELECT * FROM Product

CREATE VIEW VW_PRODUCT_CREATED_IN_LAST_TWO_DAYS
AS
SELECT Name 
FROM Product 
WHERE Status = 'InStock' AND DATEDIFF(DD,CreatedDate,getdate())<=2

SELECT * FROM VW_PRODUCT_CREATED_IN_LAST_TWO_DAYS


--#4 
CREATE VIEW VW_PRODUCT_REPORT
AS
	SELECT o.OrderID,u.UserName,o.DiscountAmount,o.payableAmount
	FROM Orders o JOIN Users u
	ON o.UserID = u.UserID

SELECT * FROM VW_PRODUCT_REPORT





