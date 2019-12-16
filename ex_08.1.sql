--Write a query to display the first name. last name, and salary of all employees in department 30, 
--formatting the salary with commas and a floating dollar sign. 
select first_name, last_name, TO_CHAR(salary,'$99,999') AS sal from employees left outer join departments on
employees.department_id = departments.department_id where departments.department_id = 30;

select * from employees;

--Write a query to display the first name, last name, and date hired of all employees in department 30, formatting the date to be year-month#-day. 
select first_name, last_name, TO_CHAR(hire_date, 'YYYY-MM-DD') AS "Date Hired" from employees left outer join departments on
employees.department_id = departments.department_id where departments.department_id = 30;

--Write a query to display the salary of all employees in department 30. Also show the salary rounded and truncated to thousands. 
select first_name, last_name, salary, TRUNC(salary,-3) AS "Truncated Salary", ROUND(salary,-3) as "Rounded Salary" from employees left outer join departments on
employees.department_id = departments.department_id where departments.department_id = 30;

--Write a query to display names of all employees in department 30. Their first name should be in lower case; their last name in upper case. 
--Sequence the list in (ascending) first name, last name order. 
select lower(first_name) as "First Name", upper(last_name) as "Last Name" from employees left outer join departments on
employees.department_id = departments.department_id where departments.department_id = 30 order by first_name asc;

--Write a query to display the initial of the first name followed by a period followed by the last name of all employees in department 30. 
--Sequence the list in alphabetical order of this formatted name. 
select substr(first_name, 1,1) ||'.' ||' '|| last_name as NAME from employees left outer join departments on 
employees.department_id = departments.department_id where departments.department_id = 30 order by first_name asc;

--Write a query to display the street address, followed by the street address stripped of any leading numeric digits, spaces, or dashes 
--(Street Name) for all rows in the locations table. Order the list by the Street Name.
select * from locations;

select street_address, LTRIM(street_address, '0123456789 - ' ) AS "No Numbers" from locations order by street_address;

--Write a query to display the street address, followed by length of the street address (Street Length) for all rows in the locations table.
--Sequence the list in the Street Length order. 
select street_address, length(street_address) as "Street Length" from locations order by "Street Length";

--Write a query to display the location ID, the street address, city, and state province of all rows in the 
--locations table that contain either the string "RUA" or "RUE" in the street address. Sequence the list in descending sequence on location ID.

select location_id, street_address, city, state_province from locations
where instr(upper(street_address), 'RUE') > 0 or
instr(upper(street_address), 'RUA') > 0
order by location_id desc;