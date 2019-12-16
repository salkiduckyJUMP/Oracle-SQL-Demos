--Produce a short report showing the number of employees who earn commission and the number who do not. 
select * from employees;

select count(*) from employees;

select 'Employees who do not earn a commision' as "Type", count(*) as "Count" from employees where commission_pct is null  
union all 
select 'Employees who earn a commision' as "Type", count(*) as "Count" from employees where commission_pct is not null;

--HR Department needs a list of department IDs for departments that do not contain the job ID ST_CLERK
select * from departments;
select * from jobs;

select department_id from departments 
minus 
select department_id from employees
where job_id = 'ST_CLERK';

--HR needs a list of Countries that have no departments located in them, display the country ID and the name of countries
select * from countries; -- has country_ID
select * from locations; -- has country_ID
select * from departments; -- has Location_id

select country_id,country_name
from countries
minus
select l.country_id,c.country_name
from locations l
join countries c 
on (l.country_id = c.country_id)
join departments d
on d.location_id = l.location_id;

select * from jobs; -- has job_id
select * from job_history; -- has job_id and department_id
select * from employees; -- has job_id and department_id
select * from departments; -- has department_id

select distinct job_id, department_id
from employees
where department_id = 10
union all
select distinct job_id, department_id
from employees
where department_id = 50
union all 
select distinct job_id, department_id
from employees
where department_id = 20;

--
select * from jobs;
select * from job_history;
select * from employees;