set sql_safe_updates =0;  -- off 
set sql_safe_updates=1;    -- on

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

-- drop /add/modify key constraints 
desc students;
-- 6. Make column NOT NULL
alter table students modify gender ENUM('Male', 'Female', 'Other') not null;

-- 7. CHANGE COLUMN (Rename + Modify)
alter table students change full_name studen_name varchar(150) not null;
select * from students;
desc students;
-- 8. RENAME COLUMN (MySQL 8+)
alter table students rename column studen_name to full_name ;

-- 8. Set or Change a Default Value
alter table students alter gender set default "Female";

-- 9. DROP COLUMN
alter table students drop address;

-- ADD/modify/drop keys 

-- 10. Add UNIQUE
-- need to drop first if exists Drop UNIQUE
-- -- First find index name and then drop
show index from students;

alter table students drop index phone ;
alter table students drop index email ;

-- add unique key 
alter table students add unique (phone);

desc students;
-- 12.Add Composite UNIQUE
alter table students add unique (phone,email);

-- drop primary key 
alter table students drop primary key;  

-- first need to drop auto increment because “You still have an AUTO_INCREMENT column, but no key for it” 
alter table students modify student_id int not null;
alter table students drop primary key;  

-- add 

alter table students add primary key(student_id);

alter table students modify student_id int auto_increment;  

-- assgn new primary key and drop old one and change auto incerment also
-- new column primary key autoincrement 
alter table students
modify student_id int not null,
add column srno int auto_increment after student_id,
drop primary key,
add primary key(srno);

select * from students;

alter table students
modify student_id int not null,
modify column srno int unique auto_increment,
drop primary key
;
