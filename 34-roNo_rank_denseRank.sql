-- row number ,rank, dense_rank
use batch730pmapr;

select * from employee; 

-- assign row number according to salary 

select firstname, lastname, salary, location,row_number() over (order by salary) as row_num from employee;

select  row_number() over (order by salary desc) as row_num, firstname, lastname, salary, location from employee;

-- fifth highest salary 
select * from
(select  row_number() over (order by salary desc) as row_num, firstname, lastname, salary from employee) temptable 
where row_num = 5;

-- the problem statement is to assign row number for partitions based on each location ..
-- select firstname, lastname, salary,location, row_number() over (partition by location) from employee;

select firstname, lastname, salary,location, row_number() over (partition by location order by salary desc) from employee;

-- I want to find the highest salary getters at each location
select * from
(select firstname, lastname, salary,location, row_number() over (partition by location order by salary desc) as row_num from employee) temptable 
where row_num=1;

-- when we use row_number
    -- we should be using the order by clause 
    -- we can also use the partition by - optional
    -- the rownumber starts from 1 for every partition
    
-- ------------------------------------------------------------------------
-- rank and dense rank

select firstname, lastname, salary, row_number() over (order by salary desc) as row_num, location from employee;
-- 30000	1
-- 25000	2
-- 20000	3
-- 20000	4
-- 15000	5
-- 15000	6
-- 15000	7
-- 10000	8
select firstname, lastname, salary, rank() over (order by salary desc) as row_num,location from employee;
-- 30000	1
-- 25000	2
-- 20000	3
-- 20000	3
-- 15000	5
-- 15000	5
-- 15000	5
-- 10000	8

select firstname, lastname, salary,dense_rank() over (order by salary desc) as row_num,  location from employee;

-- 30000	1
-- 25000	2
-- 20000	3
-- 20000	3
-- 15000	4
-- 15000	4
-- 15000	4
-- 10000	5
    
