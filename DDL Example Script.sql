--CTAS Example with Flashback, Drop, Purge, ETC:
-------
select * from employees; --has employee_id, department_id
select * from locations; -- has city
select * from departments; -- has employee_id, department_id, department_name, location_id

select department_id, location_id from departments where location_id in (select location_id from locations);

select employee_id, department_id from employees 
    where department_id in (select department_id from departments
        where location_id in (select location_id from locations
            where city in(select city from locations)));
            
select employees.first_name, employees.last_name, departments.department_id, locations.city from departments
join employees
on employees.department_id = departments.department_id
join locations
on locations.location_id = departments.location_id;

--Solution
create table emp as select e.employee_id, d.department_name, l.city from employees e
join departments d
on e.department_id = d.department_id
join locations l
on d.location_id = l.location_id;

select * from emp;
delete from emp;
rollback;
drop table emp;
Flashback table emp to before drop;
drop table emp;
purge table emp;

--Create a table agents; simple table creation with data types and constraints
-- 10, 2 -< how many decimals afterward
create table agents (
    agent_code varchar2(6) NOT NULL PRIMARY KEY,
    agent_name varchar2(40) NOT NULL,
    working_area varchar2(35) NOT NULL,
    commission decimal (10, 2) NOT NULL CHECK (commission < 1),
    phone_no varchar(15)
);

--drop table agents;
select * from agents;

--Create a table customer; foreign keys!
create table customers (
    cust_code varchar2(6) NOT NULL PRIMARY KEY,
    cust_name varchar2(25) NOT NULL UNIQUE,
    cust_city varchar2(25),
    agent_code varchar2(6) references agents(agent_code)
);

--drop table customers;

select * from customers;

--Alter table agents; add a new column 'country'
ALTER TABLE agents ADD (country  varchar2(25 )); 
ALTER TABLE agents MODIFY (country  NOT NULL); 

select * from agents;

--drop country column
alter table agents drop (country);

select * from agents;

--add a default value to 'commission' column
alter table agents modify (commission DEFAULT 0.5);

--remove default value
alter table agents modify (commission DEFAULT (null));

--add a constraint; to add a unique constraint named 'dup_che_con' to the existing column agent_code of agents table
ALTER TABLE agents ADD CONSTRAINT dup_che_con unique(agent_name);

--Drop individual constraint; drop existing unique constraint
alter table agents drop constraint dup_che_con;

--Create country_colum again modify the size of column 'country' of 'agents' table to varchar2(35)
ALTER TABLE agents ADD (country  varchar2(25 )); 
alter table agents modify (country varchar2(35));

select * from agents;

