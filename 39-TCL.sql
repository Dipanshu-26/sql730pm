-- TCL (Transaction Control Language)
-- TCL controls transactions.

-- TCL Commands
-- COMMIT
-- ROLLBACK
-- SAVEPOINT

use batch730pmapr;

-- Create Table
CREATE TABLE bank_accounts(
    account_id INT PRIMARY KEY,
    customer_name VARCHAR(50),
    balance DECIMAL(10,2)
);

-- Insert data:

INSERT INTO bank_accounts VALUES
(101,'Virat',50000),
(102,'Rohit',30000);

-- Verify:
SELECT * FROM bank_accounts;

-- by defaulte -- auto commit
SELECT @@autocommit;
SET autocommit = 0;
-- --------------------------------------------------------------
update  bank_accounts         
set balance = balance -25000 
where account_id = 101;

start transaction;             -- 50000

update  bank_accounts          -- 60000
set balance = balance +10000 
where account_id = 101;

update  bank_accounts          -- 80000
set balance = balance +20000
where account_id = 101;

update  bank_accounts
set balance = balance -5000
where account_id = 101;

rollback;        -- 50000  (all above trancaction cancled)

-- --------------------------------------------------------------------
start transaction;             -- 50000

update  bank_accounts          -- 60000
set balance = balance +10000 
where account_id = 101;

update  bank_accounts          -- 80000
set balance = balance +20000
where account_id = 101;

update  bank_accounts
set balance = balance -5000
where account_id = 101;

commit;
rollback;
SELECT * FROM bank_accounts;

-- ----------------------------------------------------------------------
start transaction;             -- 50000

update  bank_accounts          -- 60000
set balance = balance +10000 
where account_id = 101;

update  bank_accounts          -- 80000
set balance = balance +20000
where account_id = 101;
commit;

update  bank_accounts
set balance = balance -5000
where account_id = 101;

commit;
rollback;    -- not rollback -- coz transaction hasent started
SELECT * FROM bank_accounts;
-- No rollback occurred
-- because update was already committed.
-- --------------------------------------------------------------------------
update  bank_accounts
set balance = balance -25000
where account_id = 101;
start transaction;             -- 50000

update  bank_accounts          -- 60000
set balance = balance +10000 
where account_id = 101;

savepoint sp1;

update  bank_accounts          -- 80000
set balance = balance +20000
where account_id = 101;

savepoint sp2;

update  bank_accounts
set balance = balance -5000
where account_id = 101;

rollback to sp2;
commit;
rollback;   
rollback to sp1;
select * from bank_accounts;







