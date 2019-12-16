/*select last_name, salary, salary * 12, 'Wow', 1/8 from employees;*/

--desc jobs;
--
--select * from jobs;

--select job_title as position, job_title as "Position Title" from jobs;

--select city, state_province, country_id from locations;

--select country_id from locations;
--
--select distinct country_id from locations;

select * from jobs where min_salary = 4000;