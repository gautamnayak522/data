SELECT * FROM employees2

SELECT Employee_Id,First_Name,Last_Name,Salary,
 CASE WHEN Department = 'BANKING' THEN 'Bank Dept' 
	 WHEN Department = 'Insurance' THEN 'Insurance Dept' 
	 WHEN Department = 'Services' THEN 'Service Dept' 
	 ELSE 'Other'
 END AS 'Department'
 FROM Employees2