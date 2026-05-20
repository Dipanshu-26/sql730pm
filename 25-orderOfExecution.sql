-- order of execution
-- SQL executes in the following logical order:

-- 1. FROM
-- 2. WHERE (if present)
-- 3. GROUP BY (if present)
-- 4. HAVING (if present)
-- 5. SELECT
-- 6. DISTINCT (if present)
-- 7. OTRDER BY
-- 8. LIMIT (if present)

use batch730pmapr;
-- i want distinct students source of joining order by enrollment date 
select  distinct source_of_joining from students order by enrollment_date desc;

-- 0	3	19:39:05	select distinct source_of_joining from students order by enrollment_date
--  LIMIT 0, 10000	Error Code: 3065. Expression #1 of ORDER BY clause is not in SELECT list, 
--  references column 'batch730pmapr.students.enrollment_date' which is not in SELECT list; 
--  this is incompatible with DISTINCT	0.016 sec

-- ---------------------------------------------------------------------------------------
select source_of_joining from students;

-- from students ==> loading table 
-- projection ==> source of joining 

select source_of_joining,enrollment_date  from students;
-- from students;
-- source_of_joining,enrollment_date

select source_of_joining,enrollment_date  from students order by enrollment_date;
-- from students;
-- source_of_joining,enrollment_date
-- order by enrollment_date;

select source_of_joining  from students order by enrollment_date;
-- from students
-- select source_of_joining ,enrollment_date
-- order by enrollment_date
-- select source_of_joining final projection 


select  distinct source_of_joining from students order by enrollment_date desc;

-- loading table from 
--  select source_of_joining internally sql is having enrollment date 
-- distinct  ==> source_of_joining
-- order by enrollment_date    ==> not having enrollment_date

select  distinct source_of_joining,enrollment_date from students order by enrollment_date desc;




