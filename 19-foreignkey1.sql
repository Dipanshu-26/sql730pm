-- primary key , unique key
-- foreign key 
use batch730pmapr;
show tables;
drop table students;

-- courses and students 
create table courses(
course_id int primary key auto_increment,
course_name varchar(50) not null,
course_duration_months int not null,
course_fee int not null
);

INSERT INTO courses (course_id, course_name, course_duration_months, course_fee) VALUES
(1, 'Full Stack Development', 6, 45000),
(2, 'Data Science', 8, 60000),
(3, 'Automation Testing', 6, 25000),
(4, 'Gen AI', 6, 30000),
(5, 'Agentic AI', 8, 50000);

CREATE TABLE students ( 
student_id INT PRIMARY KEY auto_increment, 
full_name VARCHAR(100) NOT NULL, 
phone VARCHAR(15) UNIQUE, 
dob DATE, 
gender ENUM('M','F','O'), 
selected_course int NOT NULL DEFAULT 1, 
photo_url VARCHAR(255) default null, 
created_at DATETIME DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO students 
(full_name, phone, dob, gender, selected_course, photo_url)
VALUES
('Rahul Sharma', '9876543210', '2000-05-12', 'M', 1, 'https://img.com/rahul.jpg'),
('Priya Verma', '9123456780', '1999-11-23', 'F', 2, 'https://img.com/priya.jpg'),
('Amit Kumar', '9000011111', '2001-03-15', 'M', 1, NULL),
('Sneha Patil', '9988776655', '2002-07-08', 'F', 4, 'https://img.com/sneha.jpg'),
('John Mathew', '9090909090', '1998-01-30', 'M', 3, NULL),
('Fatima Khan', '9191919191', '2000-09-19', 'F', 2, 'https://img.com/fatima.jpg'),
('Rohit Das', '9345678901', '2001-12-05', 'M', 5, NULL),
('Anjali Nair', '9785612345', '1999-04-18', 'F', 4, 'https://img.com/anjali.jpg'),
('Karan Mehta', '9654321870', '2003-02-25', 'M', 1, NULL),
('Neha Gupta', '9567890123', '2002-06-10', 'F', 3, 'https://img.com/neha.jpg');

select * from courses;
select * from students;

INSERT INTO students 
(full_name, phone, dob, gender, selected_course, photo_url)
VALUES
('Rahul Sharma', '9876543219', '2000-05-12', 'M', 7, 'https://img.com/rahul.jpg');

-- foreign key 

drop table students;

CREATE TABLE students ( 
student_id INT PRIMARY KEY auto_increment, 
full_name VARCHAR(100) NOT NULL, 
phone VARCHAR(15) UNIQUE, 
dob DATE, 
gender ENUM('M','F','O'), 
selected_course int NOT NULL DEFAULT 1, 
photo_url VARCHAR(255) default null, 
created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
foreign key(selected_course) references courses(course_id)
);

INSERT INTO students 
(full_name, phone, dob, gender, selected_course, photo_url)
VALUES
('Rahul Sharma', '9876543210', '2000-05-12', 'M', 1, 'https://img.com/rahul.jpg'),
('Priya Verma', '9123456780', '1999-11-23', 'F', 2, 'https://img.com/priya.jpg'),
('Amit Kumar', '9000011111', '2001-03-15', 'M', 1, NULL),
('Sneha Patil', '9988776655', '2002-07-08', 'F', 4, 'https://img.com/sneha.jpg'),
('John Mathew', '9090909090', '1998-01-30', 'M', 3, NULL),
('Fatima Khan', '9191919191', '2000-09-19', 'F', 2, 'https://img.com/fatima.jpg'),
('Rohit Das', '9345678901', '2001-12-05', 'M', 5, NULL),
('Anjali Nair', '9785612345', '1999-04-18', 'F', 4, 'https://img.com/anjali.jpg'),
('Karan Mehta', '9654321870', '2003-02-25', 'M', 1, NULL),
('Neha Gupta', '9567890123', '2002-06-10', 'F', 3, 'https://img.com/neha.jpg');

INSERT INTO students 
(full_name, phone, dob, gender, selected_course, photo_url)
VALUES
('Rahul Sharma', '9876543217', '2000-05-12', 'M', 8, 'https://img.com/rahul.jpg');

-- 0	17	19:57:18	INSERT INTO students 
--  (full_name, phone, dob, gender, selected_course, photo_url)
--  VALUES
--  ('Rahul Sharma', '9876543219', '2000-05-12', 'M', 7, 'https://img.com/rahul.jpg')	
--  Error Code: 1452. Cannot add or update a child row: a foreign key constraint fails 
--  (`batch730pmapr`.`students`, CONSTRAINT `students_ibfk_1` FOREIGN KEY (`selected_course`) 
--  REFERENCES `courses` (`course_id`))	0.031 sec