-- having and partition by 
use batch730pmapr;
select * from students;
-- having 

-- source of joining total number of students 

select source_of_joining , count(*) as Total_no_students from students group by source_of_joining;
select location , count(*) as Total_no_students from students group by location;
select student_company , count(*) as Total_no_students from students group by student_company;

-- total number of students from  source of joining , total>1 
-- select source_of_joining , count(*) as total from students group by source_of_joining where total>1;

-- having 
select source_of_joining , count(*) as total from students group by source_of_joining having total>2;

-- i want to know the count of people joined throught instagram

select source_of_joining , count(*) as total from students group by source_of_joining having source_of_joining = 'instagram';

select source_of_joining , count(*) as total from students where source_of_joining = 'instagram' group by source_of_joining;

-- can we use where and having together -- yes 
-- location from where more 1 student joined and having experiance > 10years

select location , count(*) as total from students where years_of_exp > 9 group by location having total > 1;

-- important do filtering as soon as possible so we do not do havy crunching and latter filtering.


-- ---where is used before group by and do filtering on individual records

-- ---having is used after group by and do filtering on aggregated records.

-- ----we can use where and having in the same query also. 

-- ----where is more performant than having ..

-- ------------------------------------------------------------------------------------------------------------------
-- over and partition by 
show tables;
drop table employee;

CREATE TABLE employee (
firstname varchar(20),
lastname varchar(20),
age int,
salary int,
location varchar(20)
);

INSERT INTO employee VALUES ('sachin','sharma', 28, 10000, 'bangalore' ) ;

INSERT INTO employee VALUES ('shane','warne', 30, 20000, 'bangalore' );

INSERT INTO employee VALUES ('rohit','sharma', 32, 30000, 'hyderabad' ) ;

INSERT INTO employee VALUES ('shikhar','dhawan', 32, 25000, 'hyderabad');

INSERT INTO employee VALUES ('rahul','dravid', 31, 20000, 'bangalore');

INSERT INTO employee VALUES ('saurabh','ganguly', 32, 15000, 'pune');

INSERT INTO employee VALUES ('kapil','dev',34, 10000, 'pune');

-- how many people are from each location and avg salary at each location like bangalore, 3, 16666
select location, count(location), avg(salary) from employee group by location;

-- 'rahul','dravid bangalore, 3, 16666
-- 'sachin','sharma'bangalore, 3, 16666

-- select firstname, lastname, location, count(location), avg(salary) from employee group by location;  -- error

select firstname, lastname, employee.location, total, avg_sal from employee 
join
(select location, count(location) as total, avg(salary) as avg_sal from employee group by location) temptable
on 
employee.location = temptable.location;


-- over and partition by 
select firstname, lastname, location, 
count(location)  over (partition by location) as total,
avg(salary) over (partition by location) as avg_sal
from employee;




















