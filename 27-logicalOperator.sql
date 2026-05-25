-- logical operators 

use batch730pmapr;

select * from students;

-- to get students from banglore
select * from students where location = 'bangalore';

-- to get students from not  banglore

select * from students where location !='chandigarh';

select * from courses;

-- to get courses having ai
select * from courses where course_name like '% ai';

-- to get courses not having ai
select * from courses where course_name not like '% ai';

select * from courses where course_name not like '% ai %';

-- all students from mumbai who joined from youtube and having less then 15 years of experiance

select * from students where location = 'mumbai';

select * from students where years_of_exp < 20 and source_of_joining = 'youtube' and  location = 'mumbai';

