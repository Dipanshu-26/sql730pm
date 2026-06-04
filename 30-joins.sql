-- joins 
use batch730pmapr;
-- courses and students 
create table courses_join(
course_id int,
course_name varchar(50) not null,
course_duration_months int not null,
course_fee int not null
);

INSERT INTO courses_join (course_id, course_name, course_duration_months, course_fee) VALUES
(1, 'Full Stack Development', 6, 45000),
(2, 'Data Science', 8, 60000),
(3, 'Automation Testing', 6, 25000),
(4, 'Gen AI', 6, 30000),
(5, 'Agentic AI', 8, 50000);

CREATE TABLE students_join ( 
student_id INT , 
full_name VARCHAR(100) NOT NULL, 
phone VARCHAR(15) UNIQUE, 
dob DATE, 
gender ENUM('M','F','O'), 
selected_course int NOT NULL DEFAULT 1, 
created_at DATETIME DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO students_join 
(full_name, phone, dob, gender, selected_course)
VALUES
('Rahul Sharma', '9876543210', '2000-05-12', 'M', 1),
('Priya Verma', '9123456780', '1999-11-23', 'F', 2),
('Amit Kumar', '9000011111', '2001-03-15', 'M', 1),
('Sneha Patil', '9988776655', '2002-07-08', 'F', 7),
('John Mathew', '9090909090', '1998-01-30', 'M', 3),
('Fatima Khan', '9191919191', '2000-09-19', 'F', 2),
('Rohit Das', '9345678901', '2001-12-05', 'M', 7),
('Anjali Nair', '9785612345', '1999-04-18', 'F', 4),
('Karan Mehta', '9654321870', '2003-02-25', 'M', 8),
('Neha Gupta', '9567890123', '2002-06-10', 'F', 3);

select * from students_join;
select * from courses_join;

-- inner join
select students_join.full_name, students_join.phone , courses_join.course_name,courses_join.course_fee
from students_join join courses_join  
on students_join.selected_course = courses_join.course_id;

-- right join

-- all the matching records from left and right table are considered
-- +
-- all the non matching records in the right table which does not have the match in the left padded with null ...

select students_join.full_name, students_join.phone , courses_join.course_name,courses_join.course_fee
from students_join right join courses_join  
on students_join.selected_course = courses_join.course_id;

select students_join.full_name, students_join.phone , courses_join.course_name,courses_join.course_fee
from courses_join  right join students_join 
on students_join.selected_course = courses_join.course_id;

select s.full_name, s.phone , c.course_name,c.course_fee
from courses_join c right join students_join s
on s.selected_course = c.course_id;

-- ----------------------------------------------------------------------------------------------------------------------------
-- inner join 
select students_join.full_name, students_join.phone , courses_join.course_name,courses_join.course_fee
from students_join join courses_join  
on students_join.selected_course = courses_join.course_id;

select s.full_name, s.phone , c.course_name,c.course_fee
from students_join s join courses_join c
on s.selected_course = c.course_id;

-- left join 

select s.full_name, s.phone , c.course_name,c.course_fee
from students_join s left join courses_join c
on s.selected_course = c.course_id;

select s.full_name, s.phone , c.course_name,c.course_fee
from courses_join c left join students_join s
on s.selected_course = c.course_id;

-- right join

select s.full_name, s.phone , c.course_name,c.course_fee
from students_join s right join courses_join c
on s.selected_course = c.course_id;

-- outer join    -- mysql -- union 
select s.full_name, s.phone , c.course_name,c.course_fee from students_join s left join courses_join c on s.selected_course = c.course_id
union 
select s.full_name, s.phone , c.course_name,c.course_fee from students_join s right join courses_join c on s.selected_course = c.course_id;

-- left join excludeing commom rows

select s.full_name, s.phone , c.course_name,c.course_fee
from students_join s left join courses_join c
on s.selected_course = c.course_id
where  c.course_id is Null;

-- right join excludeing commom rows
select s.full_name, s.phone , c.course_name,c.course_fee
from students_join s right join courses_join c
on s.selected_course = c.course_id
where  s.selected_course is Null;

-- outer join excludeing commom rows

select s.full_name, s.phone , c.course_name,c.course_fee from students_join s left join courses_join c on s.selected_course = c.course_id
where c.course_id is null
union 
select s.full_name, s.phone , c.course_name,c.course_fee from students_join s right join courses_join c on s.selected_course = c.course_id
where  s.selected_course is Null;
