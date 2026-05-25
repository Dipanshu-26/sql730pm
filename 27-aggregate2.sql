use batch730pmapr;

-- Aggregate Functions 
-- group By, count, min,max, avg sum

select * from students;
select * from courses;
select count(*) from students;
show tables;

-- how many courses sold on dates count
select batch_date, selected_course, count(*) from students group by batch_date, selected_course;

-- min, max
select min(years_of_exp) from students;

select max(years_of_exp) from students;

-- i want name of min experiance and max experiance student

select full_name, min(years_of_exp) from students;

select full_name, years_of_exp from students order by years_of_exp limit 1;

select full_name, years_of_exp from students order by years_of_exp desc limit 1;

-- sum
-- source of joining max years of exp 
select source_of_joining , max(years_of_exp) from students group by  source_of_joining;

-- -- source of joining sum years of exp 

select source_of_joining , sum(years_of_exp) from students group by  source_of_joining;

-- source of joining average years of exp 
select source_of_joining , avg(years_of_exp) from students group by  source_of_joining;

select location , avg(years_of_exp) from students group by location;

select student_company, avg(years_of_exp) from students group by student_company;




