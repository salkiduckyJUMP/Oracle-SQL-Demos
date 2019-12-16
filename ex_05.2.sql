select * from emp;

--For each department in the employees table, show the total count of employees, the highest salary, the smallest salary, the sum of the salaries, 
--and the average of salaries (round to the nearest whole currency unit). 
SELECT  department_id, COUNT(*), MIN(salary), MAX(salary), SUM(salary) AS "Total Salary", ROUND(AVG(salary ), 0) AS "Avg Salary" FROM employees
GROUP BY department_id 
-- optional, but achieves same output sequence 
ORDER BY         department_id; 
 
--Modify the presentation sequence of the above query: the departments should be in ascending average salary order. 
SELECT  department_id,  COUNT(*), MIN(salary),  MAX(salary), SUM(salary) AS "Total Salary",  ROUND(AVG(salary), 0) AS "Avg Salary" 
FROM employees GROUP BY department_id ORDER BY AVG(salary); 
 
--Modify the previous query by adding a new column: calculate how much each department's smallest salary is below the average salary. 
--Sequence the list by this expression. 
SELECT  department_id, COUNT(*), MIN(salary), MAX(salary), SUM(salary) AS "Total Salary", ROUND(AVG(salary), 0) AS "Avg Salary", 
ROUND(AVG(salary) - MIN(salary), 0) AS "Below Avg" FROM employees 
GROUP BY department_id ORDER BY AVG(salary) - MIN(salary) DESC; 

--Modify the above query by changing the analysis: we now want to know all the above information by the manager each employee works for. 
SELECT  manager_id, COUNT(*), MIN(salary), MAX(salary), SUM(salary) AS "Total Salary", ROUND(AVG(salary), 0) AS "Avg Salary",
ROUND(AVG(salary) - MIN(salary), 0) AS "Below Avg" FROM employees 
GROUP BY  manager_id ORDER BY AVG(salary) - MIN(salary) DESC; 

--Another analysis request has been made: modify the previous query to “rate” managers within each department by how far 
--their lowest employee salary is below average. 
SELECT  department_id AS deptid, manager_id AS mgrid, COUNT(*), MIN(salary), MAX(salary), SUM(salary) AS "Total Salary", 
ROUND(AVG(salary), 0) AS "Avg Salary", ROUND(AVG(salary) - MIN(salary), 0) AS "Below Avg" FROM employees 
GROUP BY department_id, manager_id ORDER BY AVG(salary) - MIN(salary) DESC; 

--Modify the above query to show only those managers within a department that have more than 5 employees reporting to them. 
SELECT  department_id AS deptid, manager_id AS mgrid, COUNT(*), MIN(salary),  MAX(salary), SUM(salary) AS "Total Salary",        
ROUND(AVG(salary), 0) AS "Avg Salary", ROUND(AVG(salary) - MIN(salary), 0) AS "Below Avg" FROM employees 
GROUP BY department_id, manager_id HAVING  COUNT(*) > 5 ORDER BY AVG(salary) - MIN(salary) DESC; 

-- Display the sum of salary, the average of salary, and the number of employees in departments, 
--consolidating departments 0-99 together, 100-199 together, etc
SELECT  TRUNC(department_id, -2) AS "Depts by 100s", SUM(salary), AVG(salary), COUNT(*) FROM employees 
GROUP BY TRUNC(department_id, -2) ORDER BY TRUNC(department_id, -2); 

--Display the average of all departments’ average salaries. Round the result to whole currency units. 
-- Use two aggregate expressions (GROUP BY only affects the first) 
SELECT ROUND(AVG(AVG(salary))) AS "Avg of Dept Avgs" FROM employees 
GROUP BY department_id; 

 -- Use subquery as source of query (per next section) 
 SELECT ROUND(AVG("Average")) AS "Avg of Dept Avgs" FROM 
    (SELECT AVG(salary) AS "Average" FROM  employees GROUP BY department_id ); 

--Compare the result from the step above to the average of employee salaries. Is it the same? Why or why not? 
 SELECT ROUND(AVG( salary )) FROM   employees; 