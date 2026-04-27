-- composit primary key, unique key
use batch730pmapr;

show tables;
select * from  student2;
drop table student2;

create table student2(
studentid int,
courseid int,
enrollmentdate varchar(10),
primary key(studentid,courseid)
);

insert into student2 values(1,101,"1-1-2026");
insert into student2 values(1,102,"10-10-2026");
insert into student2 values(2,102,"10-10-2026");
insert into student2 values(2,101,"10-10-2026");
insert into student2(enrollmentdate) values("10-10-2026");
-- 1,101
-- 1,102
-- 2,101
select * from student2;


drop table student2;
create table student2(
studentid int auto_increment,
coursename varchar(10) default 'GenAi',
enrollmentdate varchar(10),
primary key(studentid,coursename)
);
insert into student2(enrollmentdate) values("10-10-2026");
select * from student2;

insert into student2(enrollmentdate) values("11-1-2026");
insert into student2(coursename,enrollmentdate) values("testing","11-1-2026");
insert into student2(studentid,enrollmentdate) values(5,"15-1-2026");

-- unique key 
create table student2(
studentid int,
courseid int,
enrollmentdate varchar(10),
unique (studentid,courseid)
);

insert into student2 values(1,101,"1-1-2026");
insert into student2(courseid,enrollmentdate) values(102,"10-10-2026");
insert into student2 values(2,102,"10-10-2026");
insert into student2 values(2,101,"10-10-2026");
insert into student2(enrollmentdate) values("11-10-2026");

select * from student2;