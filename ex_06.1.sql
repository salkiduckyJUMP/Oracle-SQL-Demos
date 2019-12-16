--Create a table called benefits. 
--a. Use the following columns definitions: 
--benefit_id             NUMBER(3)    NOT NULL 
--benefit_name           VARCHAR2(25) 
--benefit_type           VARCHAR2(20) DEFAULT 'HEALTH CARE' 
--benefit_effective_date DATE 
--benefit_max_allowance  NUMBER(8,2)

create table benefits (
    benefit_id NUMBER(3) NOT NULL,
    benefit_name VARCHAR(25),
    benefit_type VARCHAR(20) DEFAULT 'HEALTH CARE',
    benefit_effective_date DATE,
    benefit_max_allowance NUMBER(8,2)
);

--Make benefit_id the primary key.
alter table benefits modify (benefit_id PRIMARY KEY);

--Describe the benefits table to verify the definition
create view benefits_view as select * from benefits;

select * from benefits_view;

--Create a sequence called seq_benefits. Make its starting and incremental values 1. 
create sequence seq_benefits increment by 1 start with 1;

--Insert a row into the benefits table without a column list. 
--a. Use the sequence for the benefit_id. b. Make the name "401k", the type "Retirement", set the effective date to Jan. 1, 2010, 
--and the max allowance to 250,000. 
insert into benefits values (seq_benefits.nextval, '401k', 'Retirement',TO_DATE('01/01/2010', 'DD/MM/YYYY'),250000);

select * from benefits;

--Insert another row into the benefits table with a column list, specifying all columns. a. Use the sequence for the benefit_id. 
--b. Make the name "Medical PPO", the type "Health", set the effective date to Jan. 1, 2011, and the max allowance to 100,000. 

insert into benefits (benefit_id, benefit_name, benefit_type, benefit_effective_date, benefit_max_allowance)
values (seq_benefits.nextval, 'Medical PPO', 'Heath', TO_DATE('01/01/2010', 'DD/MM/YYYY'),100000);

select * from benefits;

--Insert another row into the benefits table with a column list, specifying all columns. a. Use the sequence for the benefit_id. 
--b. Set the type to the reserved word DEFAULT. c. Make the name "Medical Ins", set the effective date to Jan. 1, 2012, 
--and the max allowance to 125,000. 
insert into benefits (benefit_id, benefit_name, benefit_type, benefit_effective_date, benefit_max_allowance)
values (seq_benefits.nextval, 'Medical Ins', DEFAULT, TO_DATE('01/01/2012', 'DD/MM/YYYY'),125000);

--Display all rows from benefits; which is 3rd row?
select * from benefits;

--Medical INS should be the 3rd, if I hadn't messed up

--Insert another row into the benefits table with a column list. Specify all column names except for benefit_type. a. Use the sequence for the benefit_id. 
--b. Make the name "No default name provided", set the effective date to Jan. 1, 2013, and the max allowance to 150,000. 
insert into benefits (benefit_id, benefit_name, benefit_effective_date, benefit_max_allowance)
values (seq_benefits.nextval, 'No Default Name Provided', TO_DATE('01/01/2013', 'DD/MM/YYYY'),150000);

select * from benefits; -- default value is the type for the 4th row

--Display all the rows in the benefits table. What is the value of the type columns? 
select * from benefits;
--Value of type column; string

--Update all benefits rows whose type value begins with "H" to the table DEFAULT.

--Display all the rows in the benefits table. What is the value of the type columns?

--COMMIT the changes. 

--Create a view called "vw_h_b" that contains the benefit ID, name, type, and max allowance from the benefits table. 
--Only allow the rows whose value for type begins with "HEALTH". 
create view vw_h_b as select benefit_id, benefit_name, benefit_type, benefit_max_allowance from benefits where benefit_type like 'HEALTH%';

--Describe view
--View that shows benefit_id, benefit_name, benefit_type, benefit_max_allowance for all benefit plans where the type begins with 'HEALTH'
describe vw_h_b;

--Show all rows from view
select * from vw_h_b;

--Try to add a new, numeric, mandatory column to the benefits table: max_dependents. Why did the attempt fail?
alter table benefits add (max_dependents number not null);
--You cannot add a mandatory column when the table already has data! We didn't give a default value for it.

--Try to add the column again, this time specifying a DEFAULT value of 0. 
alter table benefits add (max_dependents number DEFAULT 0 not null );

select * from benefits; -- 0 is the value for all our existing data for max_dependents

select * from benefits_view; --no, it doesn't show the new column of max_dependents

--Modify the maximum size of the benefit_name column to be 50. Does this succeed? 
--a. Describe the benefits table to see the impact of the command. 
alter table benefits modify (benefit_name varchar(50)); -- It worked!

--Doesn't impact our previously existing data.
select * from benefits;

--Try to modify the maximum size of the benefit_name column to be 20. Why does this fail? 
alter table benefits modify(benefit_name varchar(20)); --It fails because our prexisting values for benefit_name are larger than 20

--Insert into the benefits table by selecting all the rows from the benefits table. 
--a. Use the row values for all columns except for the benefit_id: use the sequence number for this value.
insert into benefits
    (benefit_id, 
    benefit_name, 
    benefit_type, 
    benefit_effective_date, 
    benefit_max_allowance, 
    max_depdendents) 
select seq_benefits.nextval, 
        benefit_name, 
        benefit_type, 
        benefit_effective_date,
        benefit_max_allowance, 
        max_dependents from benefits;

select seq_benefits.nextval, benefit_name, benefit_type, benefit_effective_date, benefit_max_allowance, max_dependents from benefits;

--this one!
insert into benefits
 (benefit_id, benefit_name, benefit_type,
    benefit_effective_date,
    benefit_max_allowance, max_dependents)
    select seq_benefits.nextval,
     benefit_name, benefit_type,
    benefit_effective_date,benefit_max_allowance, max_dependents
    from benefits;
--