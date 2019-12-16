select * from employees;
select * from departments;

--Write a query to display the department ID, first and last names, hire date, and commission percentage of all employees with 
--manager 100 (Steven King) whose hire date is within 2 years of Jan 1, 2007. 
--Sequence the list in department, hire date order. Use a non-standard function to display null commissions as 0. 
select department_id, first_name, last_name, hire_date, nvl(commission_pct, 0) from employees
where manager_id = 100 and 
hire_date between add_months(DATE '2007-01-1', -24) and add_months(DATE '2007-01-01', 24) 
order by department_id, hire_date;

--Change the previous query to use a standard function to display the commission percentage. 
--This time, order the list so that those hired closest to Jan 1, 2007 are listed first. 

select department_id, first_name, last_name, hire_date, coalesce(commission_pct, 0) as commission from employees
where manager_id = 100 and 
ABS(months_between(hire_date, date '2007-01-01')) <=24
order by ABS(MONTHS_BETWEEN(hire_date, DATE '2007-01-01'));