-- revision 

create database batch730pmapr;
use batch730pmapr;

show tables;
desc students;

drop table table_name;
drop database database_name;

select * from students;

create table employee(
empid int primary key auto_increment,
fullName varchar(50) not null,
age int check(age >=20 and age <=65),
phone varchar(10) unique not null,
email varchar(50) unique,
position enum('manager','developer','hr','tester') default 'developer'
);

INSERT INTO employee (fullname, age, phone, email, position) VALUES
('Amit Sharma', 28, '9876543210', 'amit.sharma@email.com', 'Developer');


select * from employee;

INSERT INTO employee (empid,fullname, age, phone, email, position) VALUES
(null,'Priya Verma', 32, '9876543211', 'priya.verma@email.com', 'Manager');

INSERT INTO employee (empid,fullname, age, phone, email, position) VALUES
(0,'Rahul Singh', 25, '9876543212', 'rahul.singh@email.com', 'Tester');

-- null and 0 is considered as auto increment

INSERT INTO employee (empid,fullname, age, phone, email, position) VALUES
(11,'Sneha Patil', 29, '9876543213', 'sneha.patil@email.com', 'HR');

INSERT INTO employee (fullname, age, phone, email, position) VALUES
('Vikas Rao', 35, '9876543214', 'vikas.rao@email.com', 'Developer');

INSERT INTO employee (fullname, age, phone, email) VALUES
('Karan Mehta', 31, '9876543216', 'karan.mehta@email.com');

INSERT INTO employee (fullname, age, phone, email,position) VALUES
('Karan Mehta', 77, '9876543216', 'karan.mehta@email.com', 'Manager');

INSERT INTO employee (age,phone, email,position) VALUES
( 57, '9876543216', 'karan.mehta@email.com', 'Manager');

INSERT INTO employee (fullname, age,  email,position) VALUES
('Karan Mehta', 47,  'karan1.mehta@email.com', 'Manager');

INSERT INTO employee (fullname, age, phone, email, position) VALUES
('Amit Sharma', 28, '9876543210', 'amit.sharma@email.com', 'Developer'),
('Priya Verma', 32, '9876543211', 'priya.verma@email.com', 'Manager'),
('Rahul Singh', 25, '9876543212', 'rahul.singh@email.com', 'Tester'),
('Sneha Patil', 29, '9876543213', 'sneha.patil@email.com', 'HR'),
('Vikas Rao', 35, '9876543214', 'vikas.rao@email.com', 'Developer'),
('Neha Joshi', 27, '9876543215', 'neha.joshi@email.com', 'Tester'),
('Karan Mehta', 31, '9876543216', 'karan.mehta@email.com', 'Manager'),
('Pooja Desai', 26, '9876543217', 'pooja.desai@email.com', 'HR');

create table employee2(
empid int primary key,
fullName varchar(50) not null,
age int check(age >=20 and age <=65),
phone varchar(10) unique not null,
email varchar(50) unique,
position enum('manager','developer','hr','tester') default 'developer'
);

INSERT INTO employee2 (empid,fullname, age, phone, email, position) VALUES
(0,'Amit Sharma', 28, '9876543210', 'amit.sharma@email.com', 'Developer');

select * from employee2;

-- auto increment 
-- primary key 
-- unique key 
-- can be used only with one column

-- insert from other table 

select * from temp_students;
show tables;

create table student2(
name varchar(40),
phone varchar(20)
);

insert into student2(name,phone)
select name, mobile from temp_students;
select * from student2;

-- insert into student2
-- select *from temp_students;

select * from student2;