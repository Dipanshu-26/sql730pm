-- ENUM Constraint
-- -----------------
-- It restricts a column to predefined values only.
-- “Only allow values from this list.”

use batch730pmapr;
show tables;

show create table students;

-- CREATE TABLE `students` (
--    `fullName` varchar(20) NOT NULL,
--    `email_id` varchar(20) DEFAULT NULL,
--    `phone` varchar(15) DEFAULT NULL,
--    `age` int NOT NULL DEFAULT '18',
--    CONSTRAINT `students_chk_1` CHECK (((`age` >= 18) and (`age` <= 60))),
--    CONSTRAINT `students_chk_2` CHECK ((char_length(`phone`) = 10))
--  ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci

-- status , gender

drop table students;

create table students(
fullName varchar(20) not null,
email_id varchar(20),
phone varchar(15),
age int not null default 18 ,
status ENUM('active', 'passout','suspended'),
gender ENUM('male','female','other'),
check (age >= 18 and age <=60),
check (char_length(phone) =10)
);

-- null ia allowed

insert into students 
(fullName,email_id,phone, age,status,gender)
values
("amit tyagi" , "amit@gmail.com", 1234567891, 45,'active',"female");

select * from students;

-- insert into students 
-- (fullName,email_id,phone, age,status,gender)
-- values
-- ("geeta rani" , "geets@gmail.com", 1234567891, 45,'active','skjdksmale');  -- error

insert into students 
(fullName,email_id,phone, age,status)
values
("geeta rani" , "geets@gmail.com", 1234567891, 45,'active');  

-- --------------------------------------------------------------------------------
drop table students;

create table students(
fullName varchar(20) not null,
email_id varchar(20),
phone varchar(15),
age int not null default 18 ,
status ENUM('active', 'passout','suspended') not null ,
gender ENUM('male','female','other') not null,
check (age >= 18 and age <=60),
check (char_length(phone) =10)
);

insert into students 
(fullName,email_id,phone, age,status,gender)
values
("amit tyagi" , "amit@gmail.com", 1234567891, 45,'active','male');

select * from students;
insert into students 
(fullName,email_id,phone, age)
values
("geeta rani" , "geets@gmail.com", 1234567891, 45);  

-- not null works differently in ENUM 
-- not null default 'male' for gender first option in list
-- not null default 'active' for status first option in list

-- --------------------------------------------------------------------------------
drop table students;

create table students(
fullName varchar(20) not null,
email_id varchar(20),
phone varchar(15),
age int not null default 18 ,
status ENUM('active', 'passout','suspended') not null default 'passout',
gender ENUM('male','female','other') not null,
check (age >= 18 and age <=60),
check (char_length(phone) =10)
);

-- insert into students 
-- (email_id,phone, age,status,gender)
-- values
-- ("amit@gmail.com", 1234567891, 45,'active','male'); -- error 

select * from students;
insert into students 
(fullName,email_id,phone, age)
values
("geeta rani" , "geets@gmail.com", 1234567891, 45);  


