use batch730pmapr;

-- date and current timestamp
-- ==========================
-- date : (YYYY-MM-DD)

-- | Data Type     | Description                                                              | Example Stored Value  |
-- | ------------- | ------------------------------------------------------------------------ | --------------------- |
-- | DATE          | Stores only the date (YYYY-MM-DD)                                        | `2025-11-06`          |
-- | TIME          | Stores only the time (HH:MM:SS)                                          | `14:35:59`            |
-- | DATETIME      | Stores both date and time                                                | `2025-11-06 14:35:59` |
-- | TIMESTAMP     | Similar to DATETIME, but also stores time zone and updates automatically | `2025-11-06 14:35:59` |
-- | YEAR          | Stores only the year (YYYY)                                              | `2025`                |

-- | Function                   | Description                   | Example                                       | Output                |
-- | -------------------------- | ----------------------------- | --------------------------------------------- | --------------------- |
-- | CURDATE()                  | Returns current date          | `SELECT CURDATE();`                           | `2025-11-06`          |
-- | CURTIME()                  | Returns current time          | `SELECT CURTIME();`                           | `11:10:35`            |
-- | NOW()                      | Returns current date and time | `SELECT NOW();`                               | `2025-11-06 11:10:35` |
-- | CURRENT_TIMESTAMP          | Same as NOW()                 | `SELECT CURRENT_TIMESTAMP;`                   | `2025-11-06 11:10:35` |
-- | DATE_ADD()                 | Add interval to date          | `SELECT DATE_ADD(CURDATE(), INTERVAL 7 DAY);` | `2025-11-13`          |
-- | DATEDIFF()                 | Difference between two dates  | `SELECT DATEDIFF('2025-12-01', CURDATE());`   | `25`                  |
-- | YEAR(), MONTH(), DAY()     | Extract parts of date         | `SELECT YEAR(CURDATE());`                     | `2025`                |

CREATE TABLE date_demo (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50),
    dob DATE,
    login_time TIME,
    registration_datetime DATETIME DEFAULT CURRENT_TIMESTAMP,
    record_created TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    grad_year YEAR
);

--  Numeric Data Types 
--  ===================
-- Used for storing numbers (both integers and floating-point numbers).

-- a. Integer Types
-- TINYINT      	1            	-128 to 127                            	0 to 255
-- SMALLINT     	2            	-32,768 to 32,767                      	0 to 65,535
-- MEDIUMINT    	3            	-8,388,608 to 8,388,607               	0 to 16,777,215
-- INT / INTEGER	4            	-2,147,483,648 to 2,147,483,647       	0 to 4,294,967,295
-- BIGINT       	8            	-9,223,372,036,854,775,808 to           0 to 18,446,744,073,709,551,615
--                                  9,223,372,036,854,775,807	
create table signedInt(
tiny_v tinyint,
samall_v smallint,
mid_v middleint,
int_v int,
bigint_v bigint
);
select * from signedInt;
insert into signedInt values(-128,-32768,-8388608,-2147483648,-9223372036854775808);
insert into signedInt values(-128,-32769,-8388608,-2147483648,-9223372036854775808);

create table unsignedInt(
tiny_v tinyint unsigned,
samall_v smallint unsigned,
mid_v middleint unsigned,
int_v int unsigned,
bigint_v bigint unsigned
);
insert into unsignedInt values(266,32768,8388608,2147483648,9223372036854775808);

-- -----------------------------------------------------------------------------------------------------------------------------------------
-- varchar
-- ========

-- VARCHAR (Variable Character range):
-- Used to store text or string data.
-- You must specify a maximum length (e.g., `VARCHAR(50)` → up to 50 characters).
-- Takes only as much space as needed for the text + 1 byte for length info.
-- Commonly used for names, emails, addresses, etc.

-- 1. Characters allowed in `VARCHAR`**

-- `VARCHAR` can store any character, including:

--   Letters → A-Z, a-z
--   Digits → 0-9
--   Special characters → `@ # $ % & * ( ) - _ + = / , . ? !` etc.
--   Spaces and Unicode characters** (like emojis or non-English letters) if the table uses UTF-8 or similar encoding.


-- 2. Maximum length of `VARCHAR` in MySQL

-- You can define up to VARCHAR(65535) bytes per column,