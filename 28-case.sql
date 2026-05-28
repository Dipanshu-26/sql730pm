-- case 
SET SQL_SAFE_UPDATES = 0;
SET SQL_SAFE_UPDATES = 1;
use batch730pmapr;

select * from students;
select * from courses;

-- if course duration is > 6 masters course , else diploma course 
select course_id, course_name, course_duration_months,
case 
when course_duration_months > 6 then "masters course"
else "diploma course"
end as course_type
from courses;


--  people working for walmart, flipkart, microsoft we want to say product based and all others service based.
select student_id, full_name, student_company,
case 
when student_company in("walmart", "flipkart", "microsoft") then "product base"
else "service base"
end as company_type
from students;

INSERT INTO students 
(full_name, phone, dob, gender, student_email, selected_course,
 enrollment_date, years_of_exp, student_company,
 batch_date, source_of_joining, location)
VALUES
('Mithali Raj2','9100032111','1982-12-03','F','mithali3@bcci.com',2,'2024-07-01 09:00:00',23,null,'2024-07','Referral','Hyderabad'),
('Jhulan Goswami2','9100055111','1982-11-25','F','jhulan3@bcci.com',3,'2024-07-15 10:30:00',20,null,'2024-07','Referral','West Bengal');

-- mutiple conditions
select student_id, full_name, student_company,
case
when student_company in("walmart", "flipkart", "microsoft") then "product base"
when student_company is null then "not applicable"
else "service base"
end as company_type
from students;

-- update with case 

update courses 
set 
course_duration_months = case 
when course_name = "Gen AI" then 10
when course_name = "Agentic AI" then 10
else course_duration_months
end ,
course_fee = case 
when course_name = "Gen AI" then 45000
when course_name = "Agentic AI" then 65000
else course_fee
end
where course_name in ("Gen AI","Agentic AI");




