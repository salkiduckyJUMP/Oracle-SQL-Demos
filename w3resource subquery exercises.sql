--Write a query to display the name ( first name and last name ) for those employees who gets more salary than the employee whose ID is 163. 
select first_name, last_name from employees;

select first_name, last_name from employees 
where salary > (select salary from employees where employee_id = 163  );

-- Write a query to display the name ( first name and last name ), salary, department id, job id for those employees who works in the same 
--designation as the employee works whose id is 169

select * from employees; -- first_name, last_name, salary, department_id, job_id
select * from departments; -- department_id

select first_name, last_name, salary, job_id, department_id from employees where job_id in 
(select job_id from employees where employee_id = 169); 

--Write a query to display the name ( first name and last name ), salary, department id for those employees who earn such amount of salary
--which is the smallest salary of any of the departments.

select first_name, last_name, salary, department_id from employees 
where salary in 
    (select min(salary) from employees
        group by department_id);
        
--Write a query to display the employee id, employee name (first name and last name ) for all employees who earn more than the average salary. 
select employee_id, first_name, last_name from employees 
    where salary > 
        (select avg(salary) from employees);
        
--Write a query to display the employee name ( first name and last name ), employee id and salary of all employees who report to Payam.
select * from departments;
select * from employees;

select first_name, last_name, employee_id, salary from employees
    where manager_id in 
    (select employee_id from employees 
        where first_name = 'Payam');
        
--rite a query to display the department number, name ( first name and last name ), 
--job and department name for all employees in the Finance department.
select * from employees;
        
SELECT e.department_id, e.first_name, e.job_id , d.department_name  
FROM employees e , departments d  
WHERE e.department_id = d.department_id  
AND  d.department_name = 'Finance';