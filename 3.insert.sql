-- create database 
-- use database 
-- drop database 
-- create table 
-- drop table
-- descibe table 

select database();

use batch730pmapr;

show tables;

describe employee;

drop table employee;

drop database batch730pmapr;
-- ----------------------------------------------------------------------------------------------
-- CRUD Operations
-- ----------------------

-- create - insert statements
-- read - select statements
-- update - update statements
-- delete - delete statements

-- Insert statements
-- -------------------------------------------

use batch730pmapr;

create database batch730pmapr;

create table student (
name varchar(30),
emailid varchar(20),
phoneno varchar(15)
);

drop table student;

show tables ;
-- Insert statements
-- -------------------------------------------
-- 1. Simple INSERT (All columns, single row)
insert into student (name,emailid,phoneno) 
values ("dipanshu chawde", "dipanshu@gmail.com",9922447802);

-- 2️. INSERT Without Column Names (order matters!)
insert into student values ("neel chawde","neel@gmail.com","9876543222");

-- retrive 
select * from student;

-- 3️. INSERT With Multiple Rows (Bulk Insert)
insert into student (name,emailid,phoneno) 
values 
("nitin chawde", "dipanshu@gmail.com",9922447802),
("rucha gaware","rucha@gmail.com","7890345672"),
("rajasi gaware","rajasi@gmail.com","8976543456");



insert into student values 
("nitin chawde1", "dipanshu@gmail.com",9922447802),
("rucha gaware1","rucha@gmail.com","7890345672"),
("rajasi gaware1","rajasi@gmail.com","8976543456");

-- 4. insert selected column
insert into student (name, phoneno) values ("tanish chawde","9876543219");

select * from student;

insert into student (emailid, phoneno) values ("tanish@gmail","9876543219");
















