set sql_safe_updates =0;  -- off 
set sql_safe_updates=1;    -- on

-- delete and truncate

-- delete 
use batch730pmapr;

show tables;
select * from  students;
drop table students;
CREATE TABLE students (
    student_id INT AUTO_INCREMENT PRIMARY KEY,
    full_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE,
    phone VARCHAR(15) UNIQUE NOT NULL,
    age INT NOT NULL DEFAULT 19 CHECK (age > 18 AND age < 60),
    status ENUM('Active', 'Passout', 'Suspended') DEFAULT 'Active',
    gender ENUM('Male', 'Female', 'Other'),
    CHECK (phone IS NULL OR CHAR_LENGTH(phone) = 10)
);
-- Sample Data for Practice
-- ---------------------------

INSERT INTO students
(full_name, email, phone, age, status, gender)
VALUES
('Rahul Sharma', 'rahul2@gmail.com', '9876543219', 25, 'Active', 'Male'),
('Amit Verma', 'amit@gmail.com', '9876543211', 30, 'Suspended', 'Male'),
('Priya Singh', 'priya2@gmail.com', '9876543217', 28, 'Active', 'Female'),
('Neha Gupta', 'neha@gmail.com', '9876543213', 22, 'Passout', 'Female'),
('Rohit Kumar', 'rohit@gmail.com', '9876543214', 35, 'Suspended', 'Male');

-- DELETE — Row Level Operation
--    -DELETE removes specific rows from table
--    -Can use WHERE
--    -Deletes selected rows
--    -Can be rolled back (InnoDB)
--    -AUTO_INCREMENT does NOT reset

select * from students;

-- DELETE Variants
-- DML
-- 1. Delete by Primary Key
-- -------------------------
delete from students where student_id =3;

-- 2. Delete by Status
-- --------------------
delete from students where status = 'Suspended'; 

-- 3. Delete by Email
-- ---------------------
delete from students where email='neha@gmail.com';

INSERT INTO students
(full_name, email, phone, age, status, gender)
VALUES
('Amit Verma', 'amit@gmail.com', '9876543211', 30, 'Suspended', 'Male');

-- 4. Delete by Phone
-- -------------------
delete from students where phone='9876543211';
select * from students;

-- 5. Delete by Age Condition
-- ----------------------------
delete from students where age >= 28;

INSERT INTO students
(full_name, email, phone, age, status, gender)
VALUES
('Amit Verma', 'amit@gmail.com', '9876543216', 30, 'Suspended', 'Male'),
('Priya Singh', 'priya@gmail.com', '9876543212', 28, 'Active', 'Female'),
('Rohit Kumar', 'rohit@gmail.com', '9876543214', 35, 'Suspended', 'Male');

-- 6. Delete Limited Rows
DELETE FROM students LIMIT 2;

-- 7. Delete Latest Row
-- ---------------------
delete from students order by student_id desc limit 1;

-- 8. Delete All Rows
-- ---------------------
delete from students;

select * from students;

INSERT INTO students
(full_name, email, phone, age, status, gender)
VALUES
('Amit Verma', 'amit@gmail.com', '9876543216', 30, 'Suspended', 'Male');

-- truncate 
-- delets the table and recreate it with same schema
-- resets the auto increment 
truncate table students;
INSERT INTO students
(full_name, email, phone, age, status, gender)
VALUES
('Amit Verma', 'amit@gmail.com', '9876543216', 30, 'Suspended', 'Male');
