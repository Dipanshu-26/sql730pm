-- REGEXP is an operator in SQL used for pattern matching with regular expressions.

-- While LIKE provides simple pattern matching using % and _, REGEXP provides much more powerful pattern matching capabilities.

-- In MySQL, REGEXP (or RLIKE, they’re the same) is used in the WHERE clause to match a string column against a regular expression pattern.

-- It’s more powerful than LIKE, because you can define flexible rules.
-- Some common regex patterns in MySQL:

-- ^ → start of string
-- $ → end of string
-- . → any single character
-- [...] → any character in the set
-- | → OR
-- *, +, {n,m} → repetition

use batch730pmapr;

select * from students;
select * from courses;

-- Find names starting with 'r'

select full_name from students where full_name regexp "^r";

-- Find names ending with 'n'
select full_name from students where full_name regexp "gh$";

select full_name from students where full_name regexp "dhana$";

select full_name from students where full_name regexp "2$";
select full_name ,phone from students where phone regexp "11$";

-- LIKE uses wildcards: % means “any sequence of characters”.
-- REGEXP uses regular expressions, where % has no special meaning

select full_name,enrollment_date from students where enrollment_date  like "%-05-%";
select full_name,enrollment_date from students where enrollment_date  regexp "%-05-%";  -- gives empty set

select full_name,enrollment_date from students where enrollment_date  regexp "-05-";


-- Find names containing 'an'
select full_name,enrollment_date from students where full_name  regexp "an";

select full_name,enrollment_date from students where full_name  like "an";
select full_name,enrollment_date from students where full_name  like "%an%";

-- Find names that start with J and are exactly 4 letters
select full_name,enrollment_date from students where full_name  regexp "^r...........$";
select full_name,enrollment_date from students where full_name  regexp "^r..........a$";

#nitin , nthin
show tables;
select * from employee;

select * from employee where fullName regexp "nit(h)?in";

-- joins 



























