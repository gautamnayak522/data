USE EXAM

SELECT * FROM Orders
SELECT * FROM OrderItem


CREATE OR ALTER PROC usp_test @jsonData NVARCHAR(MAX)
AS
BEGIN

	DECLARE @pid INT, @uid INT, @qty INT, @odate DATE, @oid INT;

	DECLARE mydata CURSOR
	FOR
	SELECT *
	FROM OPENJSON(@jsonData)
	WITH
	(
		ProductID INT '$.ProductID',
		UserID INT '$.UserID',
		Qty INT '$.Qty',
		OrderDate DATE '$.OrderDate'
	);

	OPEN mydata;
	FETCH NEXT FROM mydata INTO @pid, @uid, @qty, @odate;

	WHILE @@FETCH_STATUS = 0
	BEGIN
		INSERT INTO Orders(UserID, OrderDate) Values (@uid,@odate);
		SELECT TOP 1 @oid = OrderID FROM Orders ORDER BY OrderID DESC
		--SET @oid = SCOPE_IDENTITY();
		PRINT @oid;
		INSERT INTO OrderItem(ProductID, OrderID, Qty) VALUES (@pid, @oid, @qty);
		FETCH NEXT FROM mydata INTO @pid, @uid, @qty, @odate;
	END

	CLOSE mydata;
	DEALLOCATE mydata;
END


EXEC usp_test N'[
		{
           "ProductID": "4",
            "UserID":"2",
           "Qty": "2",
           "OrderDate": "2022-07-08"
        },
        {
           "ProductID": "3",
			"UserID":"2",
           "Qty": "2",
           "OrderDate": "2022-07-08"
        }]'

CREATE OR ALTER TRIGGER trg_computeTotal
ON OrderItem
FOR INSERT
AS
BEGIN
	DECLARE @pid INT, @price INT, @qty INT, @oid INT;
	SELECT @pid = ProductID FROM inserted
	SELECT @price = Price FROM Product
	WHERE ProductID = @pid
	
	SELECT @qty = Qty, @oid = OrderID 
	FROM OrderItem;

	UPDATE Orders
	SET OrderAmount = @price * @qty
	WHERE OrderID = @oid
END

select * from orders
select * from OrderItem
INSERT INTO ORDERITEM VALUES(1,2,2)