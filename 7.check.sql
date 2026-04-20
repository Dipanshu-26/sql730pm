-- check , enum
--  --------------------------

use batch730pmapr;
show tables;

drop table students;

create table students(
fullName varchar(20) not null,
email_id varchar(20),
phone varchar(10),
age int not null default 18,
check (age between 18 and 60)
);

describe students;

show create table students;

insert into students 
(fullName,email_id,phone, age)
values
("rohit sharma" , "rohit@gmail.com", 123456, 18);
select * from students;

insert into students 
(fullName,email_id,phone, age)
values
("kapil sharma" , "kapil@gmail.com", 123456, 45);

-- -----------------------------------------------------
create table students(
fullName varchar(20) not null,
email_id varchar(20),
phone varchar(10),
age int not null default 18 check (age between 18 and 60)
);

create table students(
fullName varchar(20) not null,
email_id varchar(20),
phone varchar(15),
age int not null default 18 ,
check (age >= 18 and age <=60)
);

insert into students 
(fullName,email_id,phone, age)
values
("amit tyagi" , "amit@gmail.com", 12345678911123, 45);

select * from students;

drop table students;
create table students(
fullName varchar(20) not null,
email_id varchar(20),
phone varchar(15),
age int not null default 18 ,
check (age >= 18 and age <=60),
check (char_length(phone) =10)
);

show create table students;

-- CREATE TABLE `students` (
--    `fullName` varchar(20) NOT NULL,
--    `email_id` varchar(20) DEFAULT NULL,
--    `phone` varchar(15) DEFAULT NULL,
--    `age` int NOT NULL DEFAULT '18',
--    CONSTRAINT `students_chk_1` CHECK (((`age` >= 18) and (`age` <= 60))),
--    CONSTRAINT `students_chk_2` CHECK ((char_length(`phone`) = 10))
--  ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci


insert into students 
(fullName,email_id,phone, age)
values
("amit tyagi" , "amit@gmail.com", 1234567891, 45);

select * from students;

insert into students 
(fullName,email_id,phone, age)
values
("geeta rani" , "geets@gmail.com", 12345678911, 45);


-- insert into students 
-- (fullName,email_id,phone, age)
-- values
-- ("geeta rani" , "geets@gmail.com", 0123456789, 45);    -- error

insert into students 
(fullName,email_id,phone, age)
values
("geeta rani" , "geets@gmail.com", 1234567800, 45);


insert into students 
(fullName,email_id,phone, age)
values
("geeta rani" , "geets@gmail.com", "0123456789", 45);


insert ignore into students 
(fullName,email_id,phone, age)
values
("geeta rani" , "geets@gmail.com", 0123456789, 45); 


