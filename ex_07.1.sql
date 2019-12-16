--Display all rows
select * from regions;

--Add a new row for Central America. Make it ID 5. 
insert into regions (region_id, region_name) values (5, 'Central America');

--Display all rows
select * from regions;

--Add a new row for South America. Make it ID 6. 
insert into regions (region_id, region_name) values (6, 'South America');

--Display all rows
select * from regions;

--Update all regions rows with the name, Central America. Change their name to South and Central America. 
update regions set region_name = 'South and Central America' where region_name = 'Central America';

--Display all rows
select * from regions;

--Delete the regions row whose ID is 6. 
delete regions where region_id = 6;

--Display all rows
select * from regions;

--Issue a roll back
rollback;
 
--Display all rows
select * from regions;
