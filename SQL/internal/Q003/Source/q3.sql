SELECT * FROM Product
SELECT * FROM Users
SELECT * FROM Orders
SELECT * FROM Discount
SELECT * FROM OrderItem



		DECLARE @myjson NVARCHAR(MAX)
		SET @myjson = '
		[
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

        } 
		]
'

		DECLARE @lastinsert INT
		
		INSERT INTO Orders(UserId,OrderDate)	   
		SELECT UserID,OrderDate FROM OPENJSON(@myjson)
		WITH (
				UserID INT '$.UserID',
				OrderDate date '$.OrderDate'
		)

		SET @lastinsert = SCOPE_IDENTITY()
		


		INSERT INTO OrderItem(ProductID,OrderId,Qty)
		SELECT ProductID,Qty FROM OPENJSON(@myjson)
		WITH (
				ProductID INT '$.ProductID',
				Qty INT '$.Qty'
		)



DECLARE @myjson NVARCHAR(MAX) = N'[
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

SELECT ProductID,Qty FROM OPENJSON(@myjson)
		WITH (
				ProductID INT '$.ProductID',
				Qty INT '$.Qty',
		)