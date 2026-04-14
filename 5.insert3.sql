use batch730pmapr;
show tables;


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

-- -----------------------------------------------------------
drop table students;
drop table temp_students;

show tables;

create table temp_students(
name varchar(20),
email_id varchar(20),
mobile varchar(10),
location varchar(50),
age int
);

INSERT INTO temp_students (name, email_id, mobile, location, age) VALUES
('John Doe', 'john@mail.com', '9876543210', 'Pune', 25),
('Alice Smith', 'alice@mail.com', '9123456780', 'Mumbai', 28),
('Bob Lee', 'bob@mail.com', '9811122233', 'Delhi', 30),
('Emma Watson', 'emma@mail.com', '9898989898', 'Bangalore', 27),
('Liam Brown', 'liam@mail.com', '9765432101', 'Hyderabad', 24);

select * from temp_students;

create table students(
fullName varchar(20),
email_id varchar(20),
phone varchar(10)
);

select * from students;

insert into students (fullName, email_id, phone)
select  name, email_id, mobile from temp_students;

insert into students (fullName, email_id, phone)
select name , email_id, mobile from temp_students where location ='Pune';

insert into students (fullName, email_id, phone)
select name , email_id, mobile from temp_students where age >25;


-- 6. insert using SET syntax
-- ---------------------------------
insert into students 
set fullName = "dipanshu chawde",
email_id = "dipanshu@gmail.com",
phone = "9922447802";

select * from students;





