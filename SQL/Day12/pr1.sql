SELECT * FROM Employees2

SELECT * FROM Employees2 FOR JSON PATH

SELECT Employee_Id, First_Name as 'NAME.fname',Last_Name as 'NAME.lname',Salary FROM Employees2 FOR JSON AUTO

SELECT Employee_Id, First_Name as 'NAME.fname',Last_Name as 'NAME.lname',Salary FROM Employees2 FOR JSON PATH