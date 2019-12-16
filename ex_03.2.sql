SELECT e.first_name, e.last_name, d.department_name FROM employees e LEFT OUTER JOIN departments d ON e.department_id = d.department_id;

SELECT e.first_name, e.last_name, d.department_name FROM employees e RIGHT OUTER JOIN departments d ON e.department_id = d.department_id;

--Joining the employees and job_history tables, display the employee ID, first and last name, and the job ID. 
--Include all employees, whether or not they have any job history. Display in employee ID order. 
--Modify your solution to Step 4 of the previous exercise. 

select employees.employee_id, employees.first_name, employees.last_name, job_history.job_id
from employees
left outer join job_history
on employees.employee_id = job_history.employee_id
order by employee_id;

--Joining the jobs and job_history tables, display the job title and employee ID for all jobs, whether or not they have job history. 
select * from jobs;
select * from job_history;

select j.job_title, jh.employee_id
from jobs j
left outer join job_history jh
on j.job_id = jh.job_id;

--Modify the above query to restrict the result set to jobs whose minimum salary exceeds 9000
select j.job_title, jh.employee_id
from jobs j
left outer join job_history jh
on j.job_id = jh.job_id
where j.min_salary > 9000;

--Joining the jobs and job_history tables, display the job title, employee ID, and starting date for all employees who 
--      started in that job after Jan. 1, 1998. 
--Include jobs even if they do not have any history.
select j.job_title, jh.employee_id, jh.start_date
from jobs j
left outer join job_history jh
on j.job_id = jh.job_id
and start_date > '01/JAN/1998';

select * from job_history;
select * from employees;

--Modify the above query: remove the start date restriction and also include the employee's first and last names. 
select j.job_title, jh.employee_id, jh.start_date, e.first_name, e.last_name
from jobs j
left outer join job_history jh
on j.job_id = jh.job_id
left outer join employees e
on e.employee_id = jh.employee_id;

--Joining the employees, job_history, and jobs tables, display the job title, employee ID, start date, and employee first
--and last names for ALL employees, whether or not they have any job history. 

