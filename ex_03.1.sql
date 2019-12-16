--INNER JOINS
select * from locations;
select * from departments;

--Joining the locations and departments tables, display the city, location ID, and department name
select locations.city, locations.location_id, departments.department_name
from departments
join locations
on locations.location_id = departments.location_id;

--Joining the locations and countries tables, display the country name and city. 
select * from countries;

select countries.country_name, locations.city
from countries
join locations
on countries.country_id = locations.country_id;

--Joining the locations, countries, and departments tables, display the country name, city, and department name. 
select countries.country_name, locations.city, departments.department_name
from countries
join locations
on countries.country_id = locations.country_id
join departments
on departments.location_id = locations.location_id;

--Joining the employees and job_history tables, display the employee ID, first and last name, and the job ID. Display the output in sequence by employee_id. 
select * from employees; 
select * from job_history;

select employees.employee_id, employees.first_name, employees.last_name, job_history.job_id
from employees
join job_history
on employees.employee_id = job_history.employee_id
order by employee_id;

--Joining the jobs and job_history tables, display the job title, employee ID, and starting date for all employees who started in that job after Jan. 1, 1998. JOB
select * from jobs;
select * from job_history;

select jobs.job_title, job_history.employee_id, job_history.start_date
from jobs
join job_history
on jobs.job_id = job_history.job_id
where job_history.start_date > '01/JAN/1998';

-- Modify the above query: remove the start date restriction and also include the employees’ first and last names. 
select jobs.job_title, job_history.employee_id, job_history.start_date, employees.first_name, employees.last_name
from jobs
join job_history
on jobs.job_id = job_history.job_id
join employees
on job_history.employee_id = employees.employee_id;