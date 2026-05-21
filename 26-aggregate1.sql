use batch730pmapr;

-- Aggregate Functions 
-- group By, count, min,max, avg sum

select * from students;
select * from courses;
select count(*) from students;
show tables;

select count(*)from courses;

select count(student_company) from students;

select count(distinct student_company) as number_of_company from students;

select count(distinct location) from students;

select distinct location from students;

select count(distinct source_of_joining) from students;

select count(*) from students where batch_date like '%04';

select count(*) from students where enrollment_date like '2024-02%';

select distinct source_of_joining from students;

-- I want to know how many people joinged course from every reference 

select source_of_joining , count(*) from students group by source_of_joining ;

-- I wnat to know how many people joined from different location

select location , count(*) from students group by location;

select location , count(*) from students group by source_of_joining;  -- yhis wont work 

select distinct source_of_joining, location from students ;

-- I want to know count of people from differnt lication and reference 
select location , source_of_joining , count(*) from students group by location , source_of_joining ;


select location , source_of_joining  from students ;

-- How many people enroll for various courses; 

select selected_course, count(*) from students group by selected_course;





