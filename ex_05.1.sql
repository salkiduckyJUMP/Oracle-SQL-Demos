select * from emp;

--Write a query displaying how many rows there are in the emp table. 
select count(*) as "COUNT" from emp;

--Write a query displaying the empno, name, salary and commission for all rows in the emp table, sequencing the list in salary (ascending) order. 
select empno, ename, sal, comm from emp order by sal asc;

--Write a query displaying how many non-null salary values exist and how many distinct non-null salary values exist in the emp table. 
select count(sal) as "COUNT", count(distinct(sal)) as "COUNT DISTINCT" from emp;

--Write a query displaying how many non-null commission values exists, the sum of the non-null commission values,
--the average of the non-null commission values for all rows in the emp table
select count(comm) as "COUNT", sum(comm) as "SUM", avg(comm) as "AVG" from emp;

--Modify the above query by adding the average of commission values, treating unknown values as zero. 
--Round this value to three decimal places.  
select count(comm) as "COUNT", sum(comm) as "SUM", avg(comm) as "AVG", round(avg(coalesce(comm, 0)), 3) as "AVG OF ALL" from emp; -- return to

--Write a query displaying the largest and smallest salaries in the emp table. 
select max(sal) as "Maximum Salary", min(sal) as "Minimum Salary" from emp;

-- Write a query displaying the latest and the earliest hire dates in the emp table. 
select max(hiredate) as "Latest Employee", min(hiredate) as "Oldest Employee" from emp;