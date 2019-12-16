select * from departments;
select * from employees;
select * from locations;

SELECT department_id, department_name FROM departments WHERE manager_id IN ( SELECT manager_id FROM employees WHERE last_name = "Smith" );

--Display the department id and department name for all departments that have one or more employees. Order the result by department_id. 
select department_id, department_name from departments where
department_id in 
(select department_id from employees)
order by department_id;

-- Display the employee id, first name, last name, and salary for all employees that have a salary greater than the average salary
-- for all employees. Order the result by salary in descending sequence.
select employee_id, first_name, last_name, salary from employees 
where salary > (select avg(salary) from employees)
order by salary desc;

--Display the employee id, first name, last name, and salary for the employee that has the highest salary. 
select employee_id, first_name, last_name, salary from employees 
where salary = (select max(e.salary) from employees e);

--Display the employee id, first name, last name, salary, and commission_pct for all employees that have a salary greater 
--than the average salary for all employees and a commission_pct greater than the average commission_pct for all employees.
--Order the result by last_name. 
select employee_id, first_name, salary, commission_pct from employees
where salary > (select avg(salary) from employees)
and commission_pct > (
    select avg(commission_pct) from employees)
    order by last_name;

--Display the employee id, first name, and last name for the employee(s) that work in London. You will need to use two levels of subquery. 
select employee_id, first_name, last_name from employees
where department_id in (
    select department_id from departments
    where location_id in (
    select location_id from locations where city='London'
));

--Bonus Subquery Exercise

--Query to display information about employees who dos not work in those departments where some employees work whose manager id is within
--the range 100-200
select * from employees where department_id not in (
select department_id from departments where manager_id between 100 and 200 );

select department_name from departments where manager_id between 100 and 200;
--Employees who do not work for managers between 100-200

--NOT IN returns a result, NOT EXISTS returns true/false

--Write a SQL to display the details of those departments which max salary is 7000 or above for those employees who already done one or more jobs


select * from departments; --department_id
select * from employees; -- employee_id, salary, department_id
select * from job_history; -- employee_id, department_id

select * from departments
where department_id in 
    (select department_id 
    from employees 
    where employee_id in
        ( select employee_id 
            from job_history 
            group by employee_id 
            having count(employee_id) >=1)
    group by department_id
    having max(salary) >= 7000);
    
--Write a query the returns the lowest paid employee for each department ** CORRELATED SUBQUERY
select *
from employees e1
where e1.salary = (select min(salary) from employees e2 where e1.department_id = e2.department_id);


-- SELECT d.department_name FROM departments d WHERE NOT EXISTS ( SELECT 1 FROM employees e WHERE e.department_id = d.department_id 