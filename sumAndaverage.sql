--Sum and Average of commission percent values
select sum(commission_pct) as sum,
count(commission_pct) as "COUNT NOT NULL",
round(avg(commission_pct), 6) as avg,
round(sum(commission_pct) / count(commission_pct), 6) as "AVG BY CALC",
count(*) as count,
round(avg(coalesce(commission_pct, 0)), 6) as "AVG (NULL=0)",
round(sum(commission_pct) / count(*), 6) as "AVG BY CALC (NULL=0)"
from employees;

