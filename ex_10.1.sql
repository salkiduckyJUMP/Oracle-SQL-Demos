--Use the CREATE PROCEDURE statement to define a procedure called update_emp. 
--It requires six input parameters: parm_employee_id, parm_last_name, parm_email, parm_hire_date, parm_job_id and parm_salary. 

select * from employees;

--create or replace procedure update_emp (
--    parm_employee_id in employees.employee_id%TYPE,
--    parm_last_name in employees.last_name%TYPE,
--    parm_email in employees.email%TYPE,
--    parm_hire_date in employees.hire_date%TYPE,
--    parm_job_id in employees.job_id%TYPE,
--    parm_salary in employees.salary%TYPE
--)
--IS
--BEGIN
--END;

--In the executable section, update the salary in the employees table for the specified employee_id. 
--Verify that the last name, hire date, and job_id match the input parameters prior to making the change. 
create or replace procedure update_emp (
    parm_employee_id in employees.employee_id%TYPE,
    parm_last_name in employees.last_name%TYPE,
    parm_email in employees.email%TYPE,
    parm_hire_date in employees.hire_date%TYPE,
    parm_job_id in employees.job_id%TYPE,
    parm_salary in employees.salary%TYPE
)
IS emp_count NUMBER(5);
BEGIN
    UPDATE employees
    SET salary = parm_salary
    where employee_id = parm_employee_id
    and last_name = parm_last_name
    and hire_date = parm_hire_date
    and job_id = parm_hire_date;
    
    IF SQL%NOTFOUND THEN
    
        select count(*) into emp_count
        from employees where employee_id = parm_employee_id;
        
        if emp_count = 0 then
            insert into employees (employee_id, last_name, email, hire_date, job_id, salary)
            values (parm_employee_id, parm_last_name, parm_email, parm_hire_date, parm_job_id, parm_salary);     
        DBMS_OUTPUT.PUT_LINE('Employee has been inserted');
        else
            DBMS_OUTPUT.PUT_LINE('Employee already exists');
        end if;    
        
        end if;
END;

---testing
begin
    update_emp(1, 'John', 'email@google.com', DATE '2019-12-01', 'SA_MAN', 5000);
end;

select * from employees where employee_id = 1;
