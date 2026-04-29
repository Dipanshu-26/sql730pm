-- ALTER command DDL
-- -----------------
-- Alter is to alter the structure of the table.

-- -- add
-- -- modify
-- -- drop
-- -----------------
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
('Rahul Sharma', 'rahul@gmail.com', '9876543219', 25, 'Active', 'Male'),
('Amit Verma', 'amit@gmail.com', '9876543211', 30, 'Suspended', 'Male'),
('Priya Singh', 'priya@gmail.com', '9876543217', 28, 'Active', 'Female'),
('Neha Gupta', 'neha@gmail.com', '9876543213', 22, 'Passout', 'Female'),
('Rohit Kumar', 'rohit@gmail.com', '9876543214', 35, 'Suspended', 'Male');

truncate table students;
-- ------------------------------------------------------------------------------------------------
desc students;
select * from students;
-- 1. ADD Add new column
alter table students add address varchar(200);

-- 2. Add column with NOT NULL
alter table students add city varchar(50) not null;

-- 2. Add column with NOT NULL and default
alter table students add location varchar(50) not null default "pune";

-- 3. Add column at specific position
alter table students add admission_date varchar(15) default "01-01-2026" after full_name;

desc students;
-- MODIFY COLUMN (Change datatype or constraint)

-- 4. Change datatype
alter table students modify phone int;   -- error out of range

alter table students modify age varchar(20) ; 

show create table students;

-- CREATE TABLE `students` (
--    `student_id` int NOT NULL AUTO_INCREMENT,
--    `full_name` varchar(100) NOT NULL,
--    `admission_date` varchar(15) DEFAULT '01-01-2026',
--    `email` varchar(100) DEFAULT NULL,
--    `phone` varchar(15) NOT NULL,
--    `age` varchar(20) DEFAULT NULL,
--    `status` enum('Active','Passout','Suspended') DEFAULT 'Active',
--    `gender` enum('Male','Female','Other') DEFAULT NULL,
--    `address` varchar(200) DEFAULT NULL,
--    `city` varchar(50) NOT NULL,
--    `location` varchar(50) NOT NULL DEFAULT 'pune',
--    PRIMARY KEY (`student_id`),
--    UNIQUE KEY `phone` (`phone`),
--    UNIQUE KEY `email` (`email`),
--    CONSTRAINT `students_chk_1` CHECK (((`age` > 18) and (`age` < 60))),
--    CONSTRAINT `students_chk_2` CHECK (((`phone` is null) or (char_length(`phone`) = 10)))
--  ) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci


create table student(
name varchar(20) not null default "unknown name"
);
















