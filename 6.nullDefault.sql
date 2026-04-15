-- Constraints
-- NULL, Default and check Constraints
-- ------------------------------------

use batch730pmapr;

show tables;

select * from students;
select * from temp_students;

insert into students (email_id,phone) 
values ("xyz@gamil.com","123456789");

insert into students (email_id,phone) 
values ("abc@gamil.com","123456789");

drop table students;

create table students(
fullName varchar(20) not null,
email_id varchar(20),
phone varchar(10)
);

describe students;

insert into students (fullName, email_id, phone)
select  name, email_id, mobile from temp_students;


insert into students (fullName, email_id,phone) 
values ("xyz","xyz@gamil.com","123456789");

insert into students values ("abc","abc@gamil.com","123456789");

insert into students (fullName) 
values ("ms dhoni");

-- ------------------------------------------------------------------------------------

drop table students;

create table students(
fullName varchar(20) not null,
email_id varchar(20),
phone varchar(10),
age int
);

describe students;
select * from students;
insert into students (fullName,email_id,phone,age) 
values 
("nitin chawde", "dipanshu@gmail.com",9922447802,35),
("rucha gaware","rucha@gmail.com","7890345672",30),
("rajasi gaware","rajasi@gmail.com","8976543456",6);

insert into students (fullName, email_id,phone) 
values ("xyz","xyz@gamil.com","123456789");

insert into students (fullName, email_id,phone) values ("abc","abc@gamil.com","123456789");

insert into students (fullName, email_id,phone,age) values ("abc2","abc2@gamil.com","123456789",null);

-- --------------------------------------------------------------------------------------------------
drop table students;

create table students(
fullName varchar(20) not null,
email_id varchar(20),
phone varchar(10),
age int not null default 18
);

describe students;
select * from students;

insert into students (fullName,email_id,phone,age) 
values 
("nitin chawde", "dipanshu@gmail.com",9922447802,35),
("rucha gaware","rucha@gmail.com","7890345672",30),
("rajasi gaware","rajasi@gmail.com","8976543456",6);

insert into students (fullName, email_id,phone) 
values ("xyz","xyz@gamil.com","123456789");

insert into students (fullName, email_id,phone) values ("abc","abc@gamil.com","123456789");

-- insert into students (fullName, email_id,phone,age) values ("abc2","abc2@gamil.com","123456789",null);