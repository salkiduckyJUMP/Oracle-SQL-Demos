--In this exercise, you will declare and use a cursor to process the records in the employees table. 
--Increase employee salary by $5,000 for employees who were hired before Jan. 1, 2003. 
--The cursor will accept one parameter, which limits the query to return only the required employees. 

--1. In the declaration section, declare a cursor that selects an employee record from the employees table. 
--The cursor should accept one parameter called in_date_hired. 
--Compare in_date_hired with the date_hired column in the WHERE clause of the SELECT statement. 
--The cursor should include a FOR UPDATE clause to lock the selected rows. 

--Declare a record to hold the cursor results. Also declare a numeric variable, raise, and initialize it to 5000. 
--Finally, declare a date variable, v_date, and initialize it to Jan. 1, 2003. 
DECLARE
    CURSOR emp_curs(in_date_hired DATE)
    IS SELECT * from employees 
    WHERE hire_date < in_date_hired
    FOR UPDATE;
    raise employees.salary%type := 5000;
    v_date DATE := DATE '2003-01-01';
BEGIN
    FOR emp_rec in emp_curs(v_date) LOOP
        update employees set salary = salary + raise
        where CURRENT OF emp_curs;
    END LOOP;
END;

select * from employees;

select * from employees where hire_date < '01/JAN/2003';

--rollback changes
rollback;

--Modify the previous example to use a FOR-LOOP cursor instead of a regular cursor with a LOOP. 
--Set the salary to $11000; i.e., not a raise.

--Rollback