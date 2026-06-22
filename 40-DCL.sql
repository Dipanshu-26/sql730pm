-- DCL (Data Control Language)
-- DCL is used to control access and permissions on database objects.

-- DCL Commands
-- GRANT
-- REVOKE

-- 1. Create a database:
CREATE DATABASE company_db;

-- 2.Create a user:
CREATE USER 'john'@'localhost' IDENTIFIED BY 'john123';

-- GRANT : Give permissions to a user.

-- 1. Allow SELECT access
GRANT SELECT ON company_db.* TO 'john'@'localhost';

-- Meaning:
-- training_db.* : All tables in training_db
-- john can view data
-- john cannot insert/update/delete

-- 3. Allow Multiple Permissions
GRANT SELECT,INSERT,UPDATE ON company_db.* TO 'john'@'localhost';

-- Now john can:SELECT,INSERT,UPDATE but cannot delete records.

-- 4. Check Permissions
SHOW GRANTS FOR 'john'@'localhost';

-- REVOKE : Remove permissions.

REVOKE UPDATE ON company_db.* FROM 'john'@'localhost';

-- Now john cannot update data.