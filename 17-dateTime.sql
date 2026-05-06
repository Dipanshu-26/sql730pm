-- date Datatype

use batch730pmapr;
show tables;

select current_date();

select current_time();

select current_timestamp();

select now();

-- demo table 
create table time_demo(
id int auto_increment primary key,
event_name varchar(20),
event_date date ,
event_time time,
created_at datetime default current_timestamp);

insert into time_demo(event_name,event_date,event_time)
values("sql class " , current_date(), current_time());

select * from time_demo;
insert into time_demo(event_name,event_date,event_time)
values("python class " , '2026-10-10', current_time());

insert into time_demo(event_name,event_date,event_time)
values("javascript class " , '2026-10-10', '11:10:10');


create table user_audit(
user_id int primary key auto_increment,
email varchar(20),
created_at timestamp default current_timestamp,
updated_at timestamp default current_timestamp on update current_timestamp);

insert into user_audit(email)values ("abc123@gmail.com");   -- user_id1
select * from user_audit;
insert into user_audit(email)values ("efg456@gmail.com");


-- change already existing record
update user_audit set email ="xyz123@gmail.com" where user_id =1;