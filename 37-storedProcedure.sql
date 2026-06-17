use batch730pmapr;
select * from employees_training;
select * from employee; 

-- What is a Stored Procedure?
-- A Stored Procedure is a set of SQL statements stored in the database that can be executed whenever needed.

-- Benefits
-- Reusable code
-- Better performance
-- Reduces repetitive queries
-- Supports parameters
-- Used heavily in reporting and ETL processes
-- DROP PROCEDURE procedure_name; (to drop store procedure)
-- DROP PROCEDURE IF EXISTS sp_employee_count_by_department; (If you're not sure whether the procedure exists)

-- 1. Display All Employees
-- Create Procedure
-- delimeter ;

delimiter $$
create procedure sp_get_all_employee3()
begin 
select * from  employees_training
where salary > 90000;
end $$
delimiter ;

-- call
call sp_get_all_employee3();

-- --------------------------------------------------------------------
-- 2. Get Employees by Department
-- Create Procedure

delimiter $$
create procedure sp_get_byDeptName(in p_department varchar(50))
begin 
select * from employees_training
where department = p_department;
end $$
delimiter ;

-- call 
call sp_get_byDeptName('sales')

-- ----------------------------------------------------------------------
-- 3. OUT Parameter
-- Suppose you want to return the number of employees in a department.
-- Create Procedure

delimiter $$
create procedure sp_get_emp_by_dept_name(in dept_nm varchar(50) , out emp_count int)
begin 
select count(*)
into emp_count 
from employees_training
where department = dept_nm;
end $$
delimiter ;

set @total_emp =0;

call sp_get_emp_by_dept_name('it',@total_emp);

select @total_emp;

-- -------------------------------------------------------------------
-- 4. OUT Parameter with query output also
-- If you want BOTH details and count
-- You can do:

delimiter $$
create procedure sp_get_emp_count_details(in dept_nm varchar(50) , out emp_count int)
begin 
select * 
from employees_training
where department = dept_nm;

select count(*)
into emp_count 
from employees_training
where department = dept_nm;
end $$
delimiter ;

set @total_emp2 =0;

call sp_get_emp_count_details('it',@total_emp2);

select @total_emp2;

-- -----------------------------------------------------------------
-- 5. INOUT Parameter
-- Receives a value and returns a modified value.

delimiter $$
create procedure sp_bonus_salary(inout sal decimal(10,2))
begin 
set sal = sal+10000;
end $$
delimiter ;

set @salary = 85000;

call sp_bonus_salary(@salary);

select @salary;





