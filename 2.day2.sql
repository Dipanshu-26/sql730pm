-- mysql -u root -p

-- create database

create database demo730Apr;
show databases;

use demo730Apr;    -- to go in to database 

select database();  -- to know in which database 

-- varchar(limit), int
create table student(
name varchar(20),
email varchar(20),
phoneno int
);

show tables;
describe student;
desc student;

create table demo730Apr.employee(name varchar(20),location varchar(10));

drop table employee;

drop database demo730Apr;

show databases;
