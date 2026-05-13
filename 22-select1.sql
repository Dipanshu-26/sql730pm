use batch730pmapr;

drop table students;
CREATE TABLE students ( 
student_id INT PRIMARY KEY auto_increment, 
full_name VARCHAR(100) NOT NULL, 
phone VARCHAR(15) UNIQUE, dob DATE, 
gender ENUM('M','F','O'), 
student_email varchar(30) NOT NULL unique, 
selected_course int NOT NULL DEFAULT 1, 
enrollment_date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP, 
years_of_exp int NOT NULL, 
student_company varchar(30), 
batch_date varchar(30) NOT NULL, 
source_of_joining varchar(30) NOT NULL, 
location varchar(30) NOT NULL, 
photo_url VARCHAR(255) default null, 
created_at DATETIME DEFAULT CURRENT_TIMESTAMP, 
FOREIGN KEY (selected_course) REFERENCES courses(course_id) );

select * from students;
select * from courses;
truncate table courses;

INSERT INTO courses (course_id, course_name, course_duration_months, course_fee) VALUES
(1, 'Full Stack Development', 6, 45000);
-- (2, 'Data Science', 8, 60000),
-- (3, 'Automation Testing', 6, 25000),
-- (4, 'Gen AI', 6, 30000),
-- (5, 'Agentic AI', 8, 50000);


-- Normal Full Inserts (manual timestamp)
INSERT INTO students 
(full_name, phone, dob, gender, student_email, selected_course,
 enrollment_date, years_of_exp, student_company,
 batch_date, source_of_joining, location)
VALUES
('Virat Kohli','9100000001','1988-11-05','M','virat2@bcci.com',1,'2021-01-10 09:00:00',15,'amazon','2024-01','Instagram','Delhi'),
('Rohit Sharma','9100000002','1987-04-30','M','rohit2@bcci.com',2,'2022-01-10 09:00:00',17,'flipkart','2024-01','YouTube','Mumbai'),
('MS Dhoni','9100000003','1981-07-07','M','dhoni2@bcci.com',3,'2020-02-15 10:00:00',20,'apple','2024-02','Referral','Ranchi');

-- DEFAULT selected_course Used (selected_course omitted → becomes 1)

INSERT INTO students 
(full_name, phone, dob, gender, student_email,
 enrollment_date, years_of_exp, student_company,
 batch_date, source_of_joining, location)
VALUES
('Sachin Tendulkar','9100000004','1973-04-24','M','sachin2@bcci.com',
 '2024-02-15 10:00:00',24,'wipro','2024-02','Facebook','Mumbai'),
('Anil Kumble','9100000005','1970-10-17','M','kumble2@bcci.com',
 '2024-06-10 10:30:00',25,'tcs','2024-06','Friend','Bangalore');

-- TIMESTAMP DEFAULT (auto current time) (enrollment_date omitted)

INSERT INTO students 
(full_name, phone, dob, gender, student_email, selected_course,
 years_of_exp, student_company,
 batch_date, source_of_joining, location)
VALUES
('Kapil Dev','9100000006','1959-01-06','M','kapil2@bcci.com',4,
30,'infosys','2024-06','Referral','Chandigarh'),
('Yuvraj Singh','9100000007','1981-12-12','M','yuvraj2@bcci.com',4,
18,'microsoft','2024-05','Referral','Chandigarh');



INSERT INTO students 
(full_name, phone, dob, gender, student_email, selected_course,
 enrollment_date, years_of_exp, student_company,
 batch_date, source_of_joining, location)
VALUES
('Shubman Gill','9100000008','1999-09-08','M','gill2@bcci.com',2,'2023-04-01 10:45:00',5,'walmart','2024-04','Instagram','Punjab'),
('Rishabh Pant','9100000009','1997-10-04','M','pant2@bcci.com',1,'2024-04-01 10:45:00',6,'parsistence','2024-04','Instagram','Delhi'),
('Renuka Singh','9100000010','1996-02-01','F','renuka2@bcci.com',3,'2024-09-05 10:45:00',7,'amazon','2024-09','Instagram','Himachal'),
('Yastika Bhatia','9100000011','2000-01-11','F','yastika2@bcci.com',1,'2024-08-20 09:15:00',4,'tcs','2024-08','Friend','Baroda'),
('Shafali Verma','9100000012','2004-01-28','F','shafali2@bcci.com',1,'2024-08-01 11:00:00',0,'wipro','2024-08','Instagram','Haryana');


INSERT INTO students 
(full_name, phone, dob, gender, student_email, selected_course,
 enrollment_date, years_of_exp, student_company,
 batch_date, source_of_joining, location)
VALUES
('Mithali Raj','9100000013','1982-12-03','F','mithali2@bcci.com',2,'2024-07-01 09:00:00',23,'infosys','2024-07','Referral','Hyderabad'),
('Jhulan Goswami','9100000014','1982-11-25','F','jhulan2@bcci.com',3,'2024-07-15 10:30:00',20,'walmart','2024-07','Referral','West Bengal'),
('Smriti Mandhana','9100000015','1996-07-18','F','smriti2@bcci.com',2,'2024-07-15 10:30:00',10,'flipkart','2024-07','YouTube','Mumbai'),
('Harmanpreet Kaur','9100000016','1989-03-08','F','harman2@bcci.com',1,'2024-07-01 09:00:00',15,'amazon','2024-07','Instagram','Punjab');


select * from courses;
select * from students;

-- basic select 
select * from students;
select full_name, selected_course,student_company,source_of_joining from students;

-- as 
select full_name as Name, selected_course as enrolled_for ,student_company as working_at,source_of_joining from students;

-- where clause 

select full_name as Name, selected_course as enrolled_for ,student_company as working_at,source_of_joining from students  where source_of_joining = 'youtube';

select full_name as Name, selected_course as enrolled_for ,student_company as working_at,source_of_joining from students  where location = 'mumbai';

select full_name as Name, selected_course as enrolled_for ,student_company as working_at,source_of_joining, location from students  where location = 'mumbai';

select full_name, selected_course,student_company,source_of_joining from students;
-- how it will get executed 
select full_name as Name, selected_course as enrolled_for ,student_company as working_at,source_of_joining from students  where location = 'mumbai';
-- from student 
-- where location 
-- projection 

-- limit 
select full_name as Name, selected_course as enrolled_for ,student_company as working_at,source_of_joining from students  where location = 'mumbai' limit 2;

select full_name as Name, selected_course as enrolled_for ,student_company as working_at,source_of_joining from students limit 5;

select * from students;
select full_name as Name, selected_course as enrolled_for ,student_company as working_at,source_of_joining from students 
where dob >= '2000-01-01';

select full_name as Name, selected_course as enrolled_for ,student_company as working_at,source_of_joining,dob from students 
where dob >= '2000-01-01';

select full_name as Name, selected_course as enrolled_for ,student_company as working_at,source_of_joining,dob,years_of_exp, location from students 
where years_of_exp >= 15 and location = 'mumbai';

-- distinct 
select location from students;

select distinct location from students;
select distinct source_of_joining from students;
select distinct student_company from students;

