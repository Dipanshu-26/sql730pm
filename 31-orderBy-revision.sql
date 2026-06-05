use batch730pmapr;

-- SQL executes in the following logical order:

-- 1. FROM
-- 2. WHERE (if present)
-- 3. GROUP BY (if present)
-- 4. HAVING (if present)
-- 5. SELECT
-- 6. DISTINCT (if present)
-- 7. OTRDER BY
-- 8. LIMIT (if present)


-- Query 1

select source_of_joining from students;

-- step1 -- loading the table 
-- from students

-- step2 
-- projection source_of_joining 
-- ------------------------------------------------------
-- Query 2
select source_of_joining,enrollment_date from students;
-- from students
-- select source_of_joining, enrollment_date 
-- ------------------------------------------------------
-- Query 3
select source_of_joining,enrollment_date from students order by enrollment_date ;

-- from students  -- loding table
-- select source_of_joining,enrollment_date    -- projection
-- order by enrollment_date

-- ------------------------------------------------------
-- Query 4
select source_of_joining from students order by enrollment_date ;

-- from students  -- loading table
-- select source_of_joining   -- projection
-- Although only source_of_joining is requested, SQL keeps enrollment_date
-- internally because ORDER BY needs it.
-- order by enrollment_date    -- sorting 
-- select source_of_joining   -- final projection

-- ----------------------------------------------------------------------------------------------
-- Query 5
SELECT DISTINCT source_of_joining FROM students;
-- FROM students    -- table is loaded
-- SELECT source_of_joining   -- selected projection cloumn
-- DISTINCT source_of_joining  -- duplicates are removed 
-- select

-- ----------------------------------------------------------------------------------------------
-- Query 6
SELECT DISTINCT source_of_joining FROM students order by enrollment_date;

-- FROM students
-- select source_of_joining, enrollment_date
-- DISTINCT source_of_joining    -- discard enrollment_date
-- order by enrollment_date    -- sorting -- 
-- this query will not get executed 

-- ----------------------------------------------------------------------------------------------
-- Query 6
SELECT DISTINCT source_of_joining , enrollment_date FROM students order by enrollment_date desc;

-- FROM students
-- select source_of_joining, enrollment_date
-- DISTINCT source_of_joining , enrollment_date
-- order by enrollment_date    -- sorting -- 
-- this query will not get executed 

SELECT DISTINCT source_of_joining  FROM students order by source_of_joining desc;
