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









