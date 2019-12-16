--In the declaration section, declare a record emp_rec that uses the employees table as a basis. 
--Use %ROWTYPE . 
declare 
emp_rec employees%ROWTYPE;
BEGIN
   select * from emp_rec;
END;

--In the executable section, retrieve information for employee with a last name of 'Austin' into emp_rec. 
declare 
emp_rec employees%ROWTYPE;
BEGIN
   select * from emp_rec where last_name = 'Austin';
END;

--In the executable section, write a conditional structure that sets the new salary based on the employee’s’ commission. 
declare 
emp_rec employees%ROWTYPE;
salary1 NUMBER(5);
BEGIN
   select * from emp_rec where last_name = 'Austin';
   IF(commission_pct = null OR 0) then salary1:= salary + 500;
   ELSIF(commission_PCT > .2) then salary1:= salary + 300;
   ELSE salary1:= salary + 100;
   END IF;
END;  

--Write an UPDATE statement that sets the employee’s’ salary to the value derived in the IF statement
declare 
emp_rec employees%ROWTYPE;
salary1 NUMBER(5);
BEGIN
   select * from emp_rec where last_name = 'Austin';
   IF(commission_pct = null OR 0) then salary1:= salary + 500;
   ELSIF(commission_PCT > .2) then salary1:= salary + 300;
   ELSE salary1:= salary + 100;
   END IF;
   UPDATE employees set salary = salary1;
END;

--Select from the employees table for employee Austin to view the salary prior to running the block. 
select * from employees where last_name = 'Austin';

--Execute the block. Again, query the employees table to check your results. 
declare 
emp_rec employees%ROWTYPE;
salary1 NUMBER(5);
BEGIN
   select * from emp_rec where last_name = 'Austin';
   
   IF(commission_pct = null OR 0) then salary1:= salary + 500;
   ELSIF(commission_PCT > .2) then salary1:= salary + 300;
   ELSE salary1:= salary + 100;
   END IF;
   
   UPDATE employees set salary = salary1;
END;

--DECLARE 
--n_employee_id employees.employee_id%TYPE := 170; 
--n_commission employees.commission_pct%TYPE; 
--n_allowance NUMBER(4); 
--BEGIN 
--SELECT NVL(commission_pct,0) INTO n_commission FROM employees 
--WHERE employee_id = n_employee_id; IF TRUNC(n_commission * 100) = 0 
--THEN n_allowance := 500; ELSIF TRUNC(n_commission * 100) = 10 THEN n_allowance := 400; 
--ELSIF TRUNC(n_commission * 100) = 20 THEN n_allowance := 300; ELSE n_allowance := 200; 
--END IF; UPDATE employees SET salary = salary + n_allowance WHERE employee_id = n_employee_id; 
--END