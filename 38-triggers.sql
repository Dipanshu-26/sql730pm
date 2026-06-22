-- A Trigger is a block of SQL code that executes automatically when an event occurs on a table.
-- Events
    -- INSERT
    -- UPDATE
    -- DELETE
-- No need to call the trigger manually.

-- Example
-- New Employee Added
--         ↓
-- Trigger Executes Automatically
--         ↓
-- Audit Record Created

-- we will use employees_training table
use batch730pmApr;
SELECT * FROM employees_training;

-- Create Audit Table : This table will store activity logs.
-- -------------------------------------------------------------
CREATE TABLE employee_audit (
    audit_id INT AUTO_INCREMENT PRIMARY KEY,
    emp_id INT,
    emp_name VARCHAR(100),
    action_type VARCHAR(20),
    action_time DATETIME
);

-- Verify: 
SELECT * FROM employee_audit;

-- Create INSERT Trigger
-- ---------------------
drop trigger trg_employee_insert;

delimiter $$
create trigger trg_employee_insert
after insert
on employees_training
for each row 
begin
insert into employee_audit(emp_id ,emp_name ,action_type,action_time )
values (new.emp_id, new.emp_name,'insert',now());
end $$
delimiter ;

-- insert new employee

INSERT INTO employees_training
(emp_id,emp_name,middle_name,phone_no,department,joining_date,experience_years,salary)
VALUES
(107,'KL Rahul','Rahul','9876543211','Sales','2024-01-01',4.50,82000);

show create table  employees_training;

select * from employee_audit;
-- ----------------------------------------------------------------------------------------------
-- UPDATE Trigger Example
-- Create another audit table.

CREATE TABLE salary_audit (
    audit_id INT AUTO_INCREMENT PRIMARY KEY,
    emp_id INT,
    old_salary DECIMAL(10,2),
    new_salary DECIMAL(10,2),
    modified_time DATETIME
);

-- Create UPDATE Trigger
-- ----------------------
delimiter $$
create trigger trg_salary_update
after update 
on employees_training
for each row
begin 
insert into salary_audit
(emp_id,old_salary,new_salary,modified_time)
values
(new.emp_id,old.salary,new.salary,now());
end $$
delimiter ;

-- update query
update employees_training
set salary = 95000
where emp_id=101;

select * from employees_training;
select * from salary_audit;

-- -----------------------------------------------------------------

-- ------------------------------------------------------------------------
-- DELETE Trigger Example
-- --------------------------

CREATE TABLE employee_delete_audit (
    audit_id INT AUTO_INCREMENT PRIMARY KEY,
    emp_id INT,
    emp_name VARCHAR(100),
    deleted_time DATETIME
);

-- Trigger -- write delete trigger
-- ---------


-- ---------------------------------------------------------------------------------------------
-- Another Example: Prevent Negative Salary

delimiter $$
create trigger trg_salary_validation
before update
on employees_training
for each row
begin 
if new.salary < 0 then
signal sqlstate '45000'
set message_text = 'salary can not be negative';
end if ;
end $$
delimiter ;
 
update employees_training
set salary = 105000
where emp_id=101;

select * from employees_training;
select * from salary_audit;

update employees_training
set salary = -105000
where emp_id=101;


-- | SQLSTATE | Meaning              |
-- | -------- | -------------------- |
-- | 23000    | Constraint Violation |
-- | 42000    | Syntax Error         |
-- | 45000    | User Defined Error   |

-- DCL TCL 
