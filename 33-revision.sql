use batch730pmapr;
-- having and over - partition by 

select source_of_joining , count(*) as total from students group by source_of_joining  having total > 5;

-- instagram 
select source_of_joining , count(*) as total from students where source_of_joining = "instagram"  group by source_of_joining ;

select source_of_joining, count(*) as total from students where years_of_exp > 8 group by source_of_joining having total > 1;

-- ------------------------------------------------------------------------------------------------------------------------------
-- over partition by 
select * from employee;
-- how many people are from each location and avg salary at each location like bangalore, 3, 16666
select location, count(location) as loc_total, avg(salary) as avg_sal from employee group by location;

-- fname, lanme and how many people are from each location and avg salary at each location like bangalore, 3, 

select firstname, lastname , employee.location , loc_total, avg_sal from employee 
join 
(select location, count(location) as loc_total, avg(salary) as avg_sal from employee group by location) temptable
on 
employee.location= temptable.location;

-- -------------------------------------------------------------------------------------
-- over and partition by 
select firstname, lastname , location,
count(location) over (partition by location) as total,
avg(salary) over(partition by location) as avg_sal
from employee;








