

DECLARE cursor_emp_sal CURSOR
FOR SELECT 
        First_Name, 
        Salary
    FROM 
        Employees2;

DECLARE 
    @name VARCHAR(MAX), 
    @salary  INT;

OPEN cursor_emp_sal;

FETCH NEXT FROM cursor_emp_sal INTO 
    @name, 
    @salary; 

WHILE @@FETCH_STATUS = 0
    BEGIN
        PRINT @name + ' : '+ CAST(@salary AS varchar);
        FETCH NEXT FROM cursor_emp_sal INTO 
            @name, 
            @salary;
    END;

CLOSE cursor_emp_sal;

DEALLOCATE cursor_emp_sal;
