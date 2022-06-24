
SELECT FIRST_NAME,Salary FROM Employees WHERE Salary >(SELECT SALARY FROM Employees WHERE First_Name='Roy')