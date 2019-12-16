select dname, deptno from dept;

select * from dept;

select * from emp;

--Write a query to display the dname, deptno, and location of all rows in the dept table labeling them Name, DEPT# and Dept Location, respectively
select dname as "Name", deptno as "DEPT#", loc as "Dept Location" from dept;

--Write a query to display the deptno of each row in the emp table.   
select deptno from emp;

--Write a query to display each deptno in the emp table only once. 
select distinct deptno from emp;

-- Write a query to display the deptno and job of each row in the emp table. 
select deptno, job from emp;

--Write a query to display each unique combination of deptno and job in the emp table. 
select distinct deptno, job from emp;

-- Write a query to display the names of the employees who work for dept 30 in the emp table. 
select ename from emp where deptno=30;

--Write a query to display the names of the employees who were hired on Dec. 17, 1981. Specify the date in a safe format. 
select ename from emp where hiredate = '17/DEC/1981';

--Write a query to display the names of the employees who were hired on or after Dec. 17, 1981. 
select ename from emp where hiredate >= '17/DEC/1981';

-- Write a query to display the names of the employees who have the job of CLERK. 
select ename from emp where job = 'CLERK';

--Write a query to display the names of the employees whose salary is greater than 2500. 
select ename from emp where sal > 2500;

--Write a query to display the names of the employees whose salary is in the range (inclusive) of 1000 and 1600. 
select ename from emp where sal between 999 and 1601;

-- Write a query to display the names of the employees whose names contain "ER". 
select ename from emp where ename like '%ER';

--Write a query to display the names and employee numbers of the employees whose commission is undefined.
select ename, empno from emp where comm is null;

--Write a query to display the names, employee numbers, and commissions of the employees, sequencing the data in commission ascending order.
select ename, empno, comm from emp order by comm asc;

--Write a query to display the names, employee numbers, and commissions of the employees sequencing the data in commission descending order.
select ename, empno, comm from emp order by comm desc;

--Write a query to display the names and employee numbers of the employees sequencing the data in commission descending order, forcing those with unknown commissions to the bottom of the list.   
select ename, empno from emp order by comm desc nulls last;