use batch730pmapr;

-- EMPLOYEES TRAINING TABLE
-- ==========================================

CREATE TABLE employees_training (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(100),
    middle_name VARCHAR(50),
    phone_no VARCHAR(15),
    department VARCHAR(50),
    joining_date DATE,
    experience_years DECIMAL(5,2),
    salary DECIMAL(10,2)
);
-- SAMPLE DATA

INSERT INTO employees_training VALUES
(101, 'Virat Kohli', '  Raj  ', '9876543210', 'Sales', '2023-01-15', 5.75, 85000),
(102, 'Rohit Sharma', ' Kumar ', '98765432', NULL, '2022-06-10', 7.40, 92000),
(103, 'MS Dhoni', ' Singh ', '9988776655', 'Operations', '2021-03-20', -3.20, 78000),
(104, 'Hardik Pandya', '  Dev ', '9876501234', 'IT', '2024-02-05', 2.50, 65000),
(105, 'Jasprit Bumrah', '  ', '9123456789', NULL, '2020-09-12', 8.90, 98000);

select * from employees_training;
select * from employee; 


-- STRING FUNCTIONS
-- ==========================================
-- TRIM() - Remove extra spaces
select emp_name, trim(middle_name) as cleaned_mn from employees_training;

-- CONCAT() – Full Name
select concat(firstname, "_",lastname) as full_name, salary, location from employee;

-- SUBSTRING() – Extract first 3 letters of first name
select firstname, substring(firstname, 1 , 3) as short_name from employee;
-- -------------------------------------------------------------------------------------------------------------------------------
select firstname, lastname,substring(firstname, 1 , 3) as short_name, substring(location, 1,3) as loc from employee;
-- -------------------------------------------------------------------------------------------------------------------------------
select 
concat(firstname, "_",lastname) as full_name, 
concat(short_name,"_",loc) as nick_name
from
(select firstname, lastname,substring(firstname, 1 , 3) as short_name, substring(location, 1,3) as loc from employee) as e;

-- -------------------------------------------------------------------------------------------------------------------------------
select 
concat(firstname, "_",lastname) as full_name, 
concat(substring(firstname, 1,3),"_",location ) as userid,
concat(firstname, "_",lastname,"@gmail.com")as emailid
from employee;	   

-- DATE FUNCTIONS
-- ==========================================
-- DATE_FORMAT()
select * from employees_training;

select emp_id, 
date_format(joining_date,'%d-%y') as formated_date
from employees_training;

select emp_id, 
date_format(joining_date,'%d-%m-%y') as formated_date
from employees_training;

-- DATE_DIFF
select emp_id, 
datediff(current_date(), joining_date) as days_completed
from employees_training;

-- NUMERIC FUNCTIONS
-- ==========================================

-- ROUND()
-- ROUND() : Rounds a number to the nearest integer.
-- CEIL() & FLOOR()
-- CEIL() (Ceiling) : Returns the smallest integer greater than or equal to the given number.
-- FLOOR() :Returns the largest integer less than or equal to the given number.
-- ABS()
-- ABS() (Absolute Value) : Returns the positive version of a number.
select 
experience_years,
ceil(experience_years),
floor(experience_years),
round(experience_years),
abs(experience_years)
from employees_training;

-- Easy Memory Trick
-- CEIL()  → Always Up ↑
-- FLOOR() → Always Down ↓
-- ROUND() → Nearest Integer 🎯
-- ABS()   → Remove Negative Sign ➕

-- Imagine a person standing on floor 4.2 of a building:
-- CEIL  → Go up to floor 5
-- FLOOR → Go down to floor 4
-- ROUND → Go to nearest floor (4)
-- ABS   → Ignore whether the floor number is + or -


-- DATA CLEANING
-- ==========================================
-- IFNULL()
select emp_id,emp_name,department,
ifnull(department, "no dept assigned")as cleaned_department
from employees_training;

-- WINDOW FUNCTIONS (MySQL 8+)
-- ==========================================
-- LAG() returns a value from a previous row in the window partition.
-- LEAD() returns a value from a subsequent (next) row in the window partition.

-- LAG()
select emp_id, emp_name,experience_years,
lag(experience_years) over(order by emp_id) as previous_emp_exp
from  employees_training;

-- Calculate salary difference from previous employee.
select emp_id, emp_name,salary,
salary - lag(salary) over(order by emp_id) as difference_salary
from  employees_training;

-- lead 
select emp_id, emp_name,experience_years,
lead(experience_years) over(order by emp_id) as previous_emp_exp
from  employees_training;

select emp_id, emp_name,salary,
salary - lead(salary) over(order by emp_id) as difference_salary
from  employees_training;

-- ROW_NUMBER()
-- ==========================================
-- RANK()
-- ==========================================
-- DENSE_RANK()
-- ==========================================


-- SUM() OVER() – Running total of experience
-- ==========================================
select firstname, location,salary,
sum(salary) over (order by firstname) as running_total_salary
from employee;

-- --------------------------------------------------------------------------------------
select * from students;
-- AVG() OVER() – Average experience per source of joining
select full_name, location,years_of_exp,source_of_joining,
avg(years_of_exp) over (partition by source_of_joining) as avg_yrs_of_exp
from students;


-- ---------------------------
-- full_name==> concat
-- age >=30 ==> senior
-- age<30 ==> junior  
-- case -- when ---then 
-- employee
-- ----------------------------------

-- full_name_middliename ==> concat 
-- exp >=5 ==> senior
-- exp<5 ==> junior  
-- case -- when ---then 
-- total_no_days  ==>datediff
-- employees_training

