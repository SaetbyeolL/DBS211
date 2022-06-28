-- ***********************
-- Name: Saetbyeol Lim
-- ID: 149814212
-- Date: 2022-6-20
-- Purpose: Lab 06 DBS211
-- ***********************
SET AUTOCOMMIT ON;

-- Q1 SOLUTION
--1)BEGINE & END TRANSACTION: specifies the beginning and end of a transaction where the transaction start&end
--2)READ or WRITE: Specifies read or/and write operations that are executed in a transaction 
--3)COMMIT: Permanently stores or deletes the addition, modification, or deletion of rows in the table
--4)ROLLBACK: Go back to the last committed point

-- Q2 SOLUTION
CREATE TABLE staffs ( 
employeenumber INT PRIMARY key, 
lastname VARCHAR(50), 
firstname VARCHAR(50), 
extension VARCHAR(10), 
email VARCHAR(100), 
officecode VARCHAR(10), 
reportsto INT NULL, 
jobtitle VARCHAR(50) 
);

SET AUTOCOMMIT OFF; 
SET TRANSACTION READ WRITE;

-- Q3 SOLUTION
INSERT ALL
INTO staffs VALUES (1001, 'Patel', 'Ralph', 22333, 'rpatel@mail.com', 1, NULL, 'Sales Rep')
INTO staffs VALUES (1002, 'Denis', 'Betty', 33444, 'bdenis@mail.com', 4, NULL, 'Sales Rep')
INTO staffs VALUES (1003, 'Biri', 'Ben', 44555, 'bbirir@mail.com', 2, NULL, 'Sales Rep')
INTO staffs VALUES (1004, 'Newman', 'Chad', 66777, 'cnewman@mail.com', 3, NULL, 'Sales Rep')
INTO staffs VALUES (1005, 'Ropeburn', 'Audrey', 77888, 'aropebur@mail.com', 1, NULL,'Sales Rep')
SELECT * FROM dual;

-- Q4 SOLUTION
SELECT *
FROM staffs;
-- There are 5rows in 'staffs' table. 

-- Q5 SOLUTION
ROLLBACK;
SELECT*
FROM staffs;
-- nothing is in 'staffs' table.

-- Q6 SOLUTION
INSERT ALL
INTO staffs VALUES (1001, 'Patel', 'Ralph', 22333, 'rpatel@mail.com', 1, NULL, 'Sales Rep')
INTO staffs VALUES (1002, 'Denis', 'Betty', 33444, 'bdenis@mail.com', 4, NULL, 'Sales Rep')
INTO staffs VALUES (1003, 'Biri', 'Ben', 44555, 'bbirir@mail.com', 2, NULL, 'Sales Rep')
INTO staffs VALUES (1004, 'Newman', 'Chad', 66777, 'cnewman@mail.com', 3, NULL, 'Sales Rep')
INTO staffs VALUES (1005, 'Ropeburn', 'Audrey', 77888, 'aropebur@mail.com', 1, NULL,'Sales Rep')
SELECT * FROM dual;

COMMIT;
SELECT *
FROM staffs;
-- There are 5rows in 'staffs' table. 

-- Q7 SOLUTION
--a.
UPDATE staffs 
SET reportsto = 1004 
WHERE NOT employeenumber = 1004;

--b.
UPDATE staffs 
SET jobtitle = 'Sales Manager' 
WHERE employeenumber = 1004;
COMMIT;

-- Q8 SOLUTION
SELECT * 
FROM staffs;

-- Q9 SOLUTION
ROLLBACK;
--a.
SELECT * 
FROM staffs 
WHERE reportsto = 1004;
--There are 4rows in staffs table. 

--b.
-- It was not effect. Because I used 'commit' command after 7.b. once I used 'commit', it changed permanently. 

--c.
-- Whether COMMIT is used or not cause different results. 
-- In task6, I did not use 'commit' command and this caused unsaved changes. 
-- In task 9, I did use 'commit' command and this caused saved changes.  
-- When executing 'rollback', the result is different depending on the execution of 'commit'.

-- Q10 SOLUTION
DROP TABLE staffs;
COMMIT;

