-- create database 
-- use database 
-- drop database 
-- create table 
-- drop table
-- descibe table 

use batch730pmapr;

show tables;

select * from student;

drop table student;

drop database batch730pmapr;

create database batch730pmapr;

use batch730pmapr;

create table students (
name varchar(20),
email_id varchar(20),
mobile varchar(10)
);

-- Insert statements
-- -------------------------------------------
-- 1. Simple INSERT (All columns, single row)
-- -----------------------------------------------
insert into students (name,email_id,mobile) 
values ("dipanshu chawde", "dipanshu@gmail.com",9922447802);

select * from students;

-- 2️. INSERT Without Column Names (order matters!)
insert into students values ("neel chawde","neel@gmail.com","9876543222");

insert into students values ("neel@gmail.com","9876543222","neel");

-- 3️. INSERT With Multiple Rows (Bulk Insert)
-- --------------------------------------------
insert into students (name,email_id,mobile) 
values 
("nitin chawde", "dipanshu@gmail.com",9922447802),
("rucha gaware","rucha@gmail.com","7890345672"),
("rajasi gaware","rajasi@gmail.com","8976543456");

insert into students values 
("nitin chawde2", "dipanshu@gmail.com",9922447802),
("rucha gaware2","rucha@gmail.com","7890345672"),
("rajasi gaware2","rajasi@gmail.com","8976543456");

-- 4. insert selected column
-- --------------------------
insert into students (name,email_id)
values ("rahul sharma","rahul@gmail.com"),
("kapil sharma","kapil@gmail.com");

describe students;

insert into students (email_id,mobile)
values ("rahu2l@gmail.com","9988776655"),
("kapil2@gmail.com","2233445566");

select * from students;

-- 5. insert from another table
-- ---------------------------------

create table temp_students(
name varchar(20),
email_id varchar(20),
mobile varchar(10)
);

show tables;

INSERT INTO temp_students  VALUES
('Amit Sharma', 'amit@mail.com', '9876543210'),
('Priya Verma', 'priya@mail.com', '9123456780'),
('Rahul Singh', 'rahul@mail.com', '9811122233'),
('Sneha Patil', 'sneha@mail.com', '9898989898'),
('Arjun Reddy', 'arjun@mail.com', '9765432101');

select * from students;
select * from temp_students;

insert into students 
select * from temp_students;













