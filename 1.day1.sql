show databases;

-- mysql -u root -p 

-- to create new database
create database batch730pmApr;

-- to drop/delete database
drop database batch730pmApr;

-- use database
use batch730pmApr;
-- varchar
-- int
-- create table 
CREATE TABLE employee(
name varchar(15),
age int,
salary int
);

-- show list of table in db
show tables;

-- give schema / description of table
desc employee;
describe employee;

-- drop/delete table
drop table employee;



















