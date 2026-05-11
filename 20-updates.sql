-- Update Queries DML
-----------------------------------
SET SQL_SAFE_UPDATES = 0;
SET SQL_SAFE_UPDATES = 1;

use batch730pmapr;

drop table students;

CREATE TABLE students ( 
student_id INT AUTO_INCREMENT PRIMARY KEY, 
full_name VARCHAR(100) NOT NULL, 
email VARCHAR(100) UNIQUE, 
phone VARCHAR(15), 
age INT NOT NULL DEFAULT 19 CHECK (age > 18 AND age < 60), 
status ENUM('Active', 'Passout', 'Suspended') DEFAULT 'Active', 
gender ENUM('Male', 'Female', 'Other'), 
CHECK (phone IS NULL OR CHAR_LENGTH(phone) = 10) 
);

-- 🎯 1. Seed Data (Valid Insert)
INSERT INTO students (full_name, email, phone, age, status, gender) VALUES
('Amit Sharma', 'amit.sharma@mail.com', '9876543210', 25, 'Active', 'Male'),
('Priya Verma', 'priya.verma@mail.com', '9123456780', 28, 'Active', 'Female'),
('Rahul Singh', 'rahul.singh@mail.com', '9811122233', 30, 'Passout', 'Male'),
('Sneha Patil', 'sneha.patil@mail.com', '9898989898', 27, 'Active', 'Female'),
('Arjun Reddy', 'arjun.reddy@mail.com', '9765432101', 24, 'Suspended', 'Male'),
('Neha Gupta', 'neha.gupta@mail.com', '9988776655', 26, 'Active', 'Female'),
('Karan Mehta', 'karan.mehta@mail.com', '9871234567', 29, 'Active', 'Male');

select * from students;

-- “What will happen if age = 17?”  CHECK constraint error 

-- UPDATE Queries (All Variants)
-- -----------------------------

-- 1. Update Single Column
-- ------------------------
update students set status = "Active" where full_name="Amit Sharma";
update students set status = "Passout" where student_id = 1;

-- Update one column for one row”

-- 2. Update Multiple Columns
-- -------------------------------
update students set age =25 , status = "Active" where full_name = "Arjun Reddy";

-- 3. Update All Rows
-------------------
update students set status = "Active";

-- Dangerous — updates entire table

-- 4. Update with Condition
-- ------------------------
update students set status  = "Passout" where  age > 28;
select * from students;
-- 5. Update Using AND Condition
-- --------------------------------
update students set status = "Suspended" where age > 25 and gender = "Male";

-- 6. Update Using OR Condition
-- ------------------------------
update students set status = "Passout" where full_name = "Rahul Singh" or full_name = "Karan Mehta";


-- 7. Update Using IN
-- -----------------------
update students set status = "Passout" where full_name in ("Priya Verma" , "Amit Sharma");

-- 8. Update with LIKE
-- ---------------------
update students set status  = "Suspended" where full_name like "A%" ;

update students set status  = "Active" where full_name like "%ma" ;
select * from students;

-- 9. Update NULL Values
-- ------------------------
INSERT INTO students (full_name, email, phone, age, status, gender) VALUES
('Amit Sharma2', 'amit.sharma2@mail.com', '9876543215', 25, 'Active', 'Male');
INSERT INTO students (full_name, email, phone, age, status, gender) VALUES
('Amit Sharma3', 'amit.sharma3@mail.com', null, 25, 'Active', 'Male');
update students set phone = '9999999999' where phone is null;


-- 10. Update with Expression
-- ----------------------------
update students set age = age + 1;

-- Increment all ages

-- 11. Update with LIMIT (MySQL specific)
-- ----------------------------------------
update students set status = "Passout" limit 2;


-- 12. Update with ORDER BY
-- --------------------------

update students set status = "Suspended"  order by age desc limit 2;