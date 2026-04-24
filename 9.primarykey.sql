-- KEY CONSTRAINTS PRIMARY KEY, UNIQUE KEY , COMPOSIT PRIMARY AND UNOQUE KEY
-- ---------------------------------------------------------------------------
-- AUTO INCREMENT CONSTRAINTS
-- ---------------------------
-- PRIMARY KEY
-- -----------

-- create database , table, inserts , drop, desc
-- check , enum , default,not null

use batch730pmapr;
show tables;

show create table students;

-- CREATE TABLE `students` (
--    `fullName` varchar(20) NOT NULL,
--    `email_id` varchar(20) DEFAULT NULL,
--    `phone` varchar(15) DEFAULT NULL,
--    `age` int NOT NULL DEFAULT '18',
--    `status` enum('active','passout','suspended') DEFAULT NULL,
--    `gender` enum('male','female','other') DEFAULT NULL,
--    CONSTRAINT `students_chk_1` CHECK (((`age` >= 18) and (`age` <= 60))),
--    CONSTRAINT `students_chk_2` CHECK ((char_length(`phone`) = 10))
--  ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci

desc students;
select * from students;
insert into students 
(fullName,email_id,phone, age)
values
("amit tyagi" , "amit@gmail.com", 1234567891, 45);

-- A Primary Key: 
-- Uniquely identifies each row
-- Cannot be NULL
-- Only ONE per table
-- Automatically creates an index

drop table students;

create table students(
student_id int primary key,
fullName varchar(20) not null,
email_id varchar(20),
phone varchar(15),
age int not null default 18 ,
check (age >= 18 and age <=60),
check (char_length(phone) =10)
);
desc students;
create table students(
student_id int,
fullName varchar(20) not null,
email_id varchar(20),
phone varchar(15),
age int not null default 18 ,
check (age >= 18 and age <=60),
check (char_length(phone) =10),
primary key(student_id)
);

insert into students 
(student_id, fullName, email_id, phone, age)
values
(1,"amit tyagi" , "amit@gmail.com", 1234567891, 45);

select * from students;

insert into students 
(student_id, fullName, email_id, phone, age)
values
(1,"amit tyagi" , "amit@gmail.com", 1234567891, 45); -- error

insert into students 
(student_id, fullName, email_id, phone, age)
values
(2,"amit tyagi" , "amit@gmail.com", 1234567891, 45);

insert into students 
(student_id, fullName, email_id, phone, age)
values
(null,"amit tyagi" , "amit@gmail.com", 1234567891, 45); -- error

insert into students 
(fullName, email_id, phone, age)
values
("amit tyagi" , "amit@gmail.com", 1234567891, 45); -- error

insert into students 
(student_id, fullName, email_id, phone, age)
values
(59,"amit tyagi" , "amit@gmail.com", 1234567891, 45);

insert into students 
(student_id, fullName, email_id, phone, age)
values
(89,"amit tyagi" , "amit@gmail.com", 1234567891, 45);

-- ----------------------------------------------------------------------------------------
-- AUTO_INCREMENT KEY
-- ------------------
-- Automatically generates next number.

-- what if i dont wnat to five primary key manually or cant remember last number in list

drop table students;

create table students(
student_id int auto_increment,
fullName varchar(20) not null,
email_id varchar(20),
phone varchar(15),
age int not null default 18 ,
check (age >= 18 and age <=60),
check (char_length(phone) =10),
primary key(student_id)
);


-- create table students(
-- student_id int primary key auto_increment,
-- fullName varchar(20) not null,
-- email_id varchar(20),
-- phone varchar(15),
-- age int not null default 18 ,
-- check (age >= 18 and age <=60),
-- check (char_length(phone) =10)
-- );
INSERT INTO students (fullName, age)
VALUES ('kapil dev', 25);

INSERT INTO students (student_id, fullName, age) VALUES (2, 'sunil', 30);

INSERT INTO students
(fullName, email_id, phone, age)
VALUES
('virat koholi', 'rahul@gmail.com', '9876543210', 25);

INSERT INTO students 
(student_id,fullName, email_id, phone, age)
VALUES
(10,'rohit sharma', 'rohit@gmail.com', '9876543210', 25);

INSERT INTO students
(fullName, email_id, phone, age)
VALUES
('rinku rani', 'rinku@gmail.com', '9876543210', 25);

INSERT INTO students
(student_id,fullName, email_id, phone, age)
VALUES
(8,'rinku rani2', 'rinku@gmail.com', '9876543210', 25);

-- INSERT INTO students
-- (student_id,fullName, email_id, phone, age)
-- VALUES
-- (null,'amit tyagi', 'amit@gmail.com', '9876543210', 25);

select * from students;

-- ----------------------------------------------------------------------
-- UNIQUE KEY
-- Ensures values are unique
-- Multiple UNIQUE keys allowed
-- Allows NULL (important!)(manuall and by default when value not given)

drop table students;

create table students(
student_id int auto_increment,
fullName varchar(20) not null,
email_id varchar(20) unique,
phone varchar(15) unique not null,
age int not null default 18 ,
check (age >= 18 and age <=60),
check (char_length(phone) =10),
primary key(student_id)
);


INSERT INTO students (fullName, age)
VALUES ('kapil dev', 25); -- phoeno must

INSERT INTO students (student_id, fullName,phone, age) VALUES (2, 'sunil', 1234567891,30);

INSERT INTO students
(fullName, email_id, phone, age)
VALUES
('virat koholi', 'rahul@gmail.com', 1234567891, 25);  -- error

INSERT INTO students
(fullName, email_id, phone, age)
VALUES
('virat koholi', 'rahul@gmail.com', 2134567891, 25);  

INSERT INTO students 
(student_id,fullName, email_id, phone, age)
VALUES
(10,'rohit sharma', 'rohit@gmail.com', '9876543210', 25);

INSERT INTO students(fullName,  phone, age)
VALUES
('rinku rani',  '9876543210', 25);

INSERT INTO students
(student_id,fullName, email_id, phone, age)
VALUES
(8,'rinku rani2', 'rahul@gmail.com', '4576543210', 25);   -- error

select * from students;