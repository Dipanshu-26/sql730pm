use batch730pmapr;
select * from students;

select full_name as Name, selected_course as enrolled_for ,student_company as working_at,source_of_joining,dob,years_of_exp, location from students 
where years_of_exp >= 15 and location = 'mumbai';

-- distinct 
select distinct source_of_joining from students;

select distinct student_company from students;

select distinct location from students;

-- order by
select full_name as Name, selected_course as enrolled_for ,student_company as working_at,source_of_joining,years_of_exp, location from students;

select full_name , selected_course  ,student_company ,source_of_joining,years_of_exp, location 
from students order by years_of_exp;

select full_name , selected_course  ,student_company ,source_of_joining,years_of_exp, location 
from students order by years_of_exp desc;

select full_name , student_company  from students order by years_of_exp desc;
-- order by column need not to be part of select clause 

select full_name , location, years_of_exp from students order by 3 desc;

select full_name , location, years_of_exp from students order by years_of_exp , location ;

select full_name , location, years_of_exp from students order by years_of_exp , location desc;

select full_name , location, years_of_exp from students order by years_of_exp desc, location ;



