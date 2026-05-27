-- logical operators 

use batch730pmapr;

select * from students;

-- to get students from banglore
select * from students where location = 'bangalore';
select full_name as name  , location as city from students where location = 'bangalore';

-- to get students from not  banglore

select * from students where location !='chandigarh';
select full_name as name  , location as city from students where location !='chandigarh';
select * from courses;

-- to get courses having ai
select * from courses where course_name like '% ai';

-- to get courses not having ai
select * from courses where course_name not like '% ai';

select * from courses where course_name not like '% ai %';

-- all students from mumbai who joined from youtube and having less then 15 years of experiance

select * from students where location = 'mumbai';

select * from students where years_of_exp < 20 and source_of_joining = 'youtube' and  location = 'mumbai';
select * from students where years_of_exp < 20 or source_of_joining = 'youtube' or  location = 'mumbai';

-- get all students who do not fall between 8 to 12 years of experiance 

select * from students where years_of_exp < 8 or years_of_exp > 12 ;

select * from students where years_of_exp between 8 and 12;

select * from students where years_of_exp not  between 8 and 12;

-- get the list of students who are working amazon , walmart , apple 

select full_name, student_company from students where student_company ="amazon" or student_company ="apple" or student_company ="walmart";

select full_name, student_company from students where student_company in ('amazon' , 'walmart' , 'apple');

-- get the list of students who are not working amazon , walmart , apple 

select full_name, student_company from students where student_company not  in ('amazon' , 'walmart' , 'apple');

-- and , or , not , in , between , = , != , like , % 

-- ------------------------------------------------------------------------------------------------------------------
--  if a course is more than 6 months i want to categorize it as masters course else diploma

-- case 
select course_id,course_name, course_duration_months,
case 
when course_duration_months >6 then "masters course"
else "diploma course"
end as course_category 
from courses;












