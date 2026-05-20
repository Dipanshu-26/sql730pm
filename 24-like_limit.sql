-- like and limit

use batch730pmapr;
select * from students;

-- limit

select full_name , selected_course ,student_company ,source_of_joining,years_of_exp, location from students 
order by years_of_exp desc limit 5;

select full_name , selected_course ,student_company ,source_of_joining,years_of_exp, location from students 
order by years_of_exp  limit 5;

select full_name , selected_course, enrollment_date from students order by enrollment_date;

select full_name , selected_course, enrollment_date from students order by enrollment_date desc limit 10;

select full_name , selected_course, enrollment_date from students order by enrollment_date  limit 3,4;   -- start from 0 and total 3 records

select full_name , selected_course, enrollment_date from students order by enrollment_date desc limit 0,3;   -- start from 0 and total 3 records

select full_name , selected_course, enrollment_date from students order by enrollment_date  limit 2,5;   -- start from 2 and total 5 records


select full_name , selected_course, enrollment_date from students order by enrollment_date  desc limit 2,5;   -- start from 2 and total 5 records
--  0 1 2 3 4
-- [1,2,3,4,5]

-- like 
-- fuzzy match 
-- % ==> 0 or more char 
-- _ ==> only one char

select full_name , selected_course, enrollment_date from students where full_name like "%gh";

select full_name , selected_course, enrollment_date from students where full_name like "%kar";

select * from students;
select full_name , selected_course, enrollment_date from students where full_name like "%sin%";

select full_name , selected_course, enrollment_date from students where full_name like "%li%";         -- 0 or more char

select full_name , selected_course, student_company from students where student_company like "___";    -- one _ for 1 char

select full_name , selected_course, student_company from students where student_company like "_____";

select full_name , selected_course, student_company from students where full_name like 'rohi%t';

-- nitin , nithin == > nitin nithin