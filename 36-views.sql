-- View : A View is a virtual table created from a SQL query.

-- CREATE VIEW view_name AS
-- SELECT ...

-- Advantages:
-- Does not change original data
-- Can apply cleaning and business rules
-- Simplifies complex queries
-- Power BI can directly connect to views
-- Provides a reporting layer over raw data

use batch730pmapr;
select * from employees_training;
select * from employee; 

-- View 1: Basic Data Cleaning
-- Purpose to Clean spaces and null values.

create view emp_basic_cleaning as
select emp_id, emp_name,
trim(middle_name) as middle_name,
ifnull(department,"not assigned") as department,
joining_date, experience_years,salary
from employees_training;

select * from emp_basic_cleaning;
-- ------------------------------------------------------------------------
-- view 2 : identify bad data 

select emp_id, emp_name, department, experience_years, salary
from employees_training;

-- view 

create view vw_employee_position as
select emp_id, emp_name,
ifnull(department,"not assigned") as department,
case 
when experience_years < 6 then "lead"
else "manager"
end as position
from employees_training;

select * from vw_employee_position;

-- ------------------------------------------------------------

create view employee_vw as 
select emp_id, emp_name, salary from employees_training;

select * from employee_vw;

select emp_name, salary from employee_vw where salary > 90000;

-- ----------------------------------------------------------

-- update 
update employee_vw
set salary = 95000
where emp_id = 102;

-- Non-Updatable View ❌

-- If the view contains:

-- GROUP BY
-- DISTINCT
-- Aggregate functions (SUM, AVG, COUNT)
-- UNION
-- Window functions
-- Multiple complex joins

-- then MySQL will not allow updates.
-- --------------------------------------------------------------

create view dept_summery_vw as
select department, 
avg(salary) as avg_sal
from employees_training
group by department;

select * from dept_summery_vw;

-- update : not possible in above viwe
update dept_summery_vw
set avg_salary = 100000
where department = "sales";











