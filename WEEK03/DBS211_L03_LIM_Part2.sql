-- ***********************
-- Name: Saetbyeol Lim
-- ID: 149814212
-- Date: 6/3/2022
-- Purpose: Lab 03 DBS211 � Part 2
-- ***********************
CREATE TABLE employees AS
SELECT *
FROM dbs211_employees;

ALTER TABLE employees
ADD CONSTRAINT employees_pk
PRIMARY KEY (employeenumber);
   
ALTER TABLE employees
ADD CONSTRAINT employees_fk
FOREIGN KEY (REPORTSTO)
REFERENCES employees (employeenumber);

-- Q1 SOLUTION --
--SELECT max(employeenumber)
--FROM employees;
INSERT INTO employees (employeenumber, lastname, firstname, extension, email, officecode, reportsto, jobtitle)
VALUES ('1703', 'Lim', 'Saetbyeol', 'x32325', 'slim62@myseneca.ca', '4', '1088', 'Accountant');

-- Q2 SOLUTION --
SELECT *
FROM employees
WHERE employeenumber = '1703';

-- Q3 SOLUTION --
UPDATE employees 
SET jobtitle = 'Head Cashier' 
WHERE employeenumber = '1703';

-- Q4 SOLUTION --
INSERT INTO employees(employeenumber, lastname, firstname, extension, email, officecode, reportsto, jobtitle)
VALUES ('1777', 'choi', 'soojung', 'x7777', 'sjchoi@myseneca.ca', '2', '1703', 'Cashier');

-- Q5 SOLUTION --
DELETE FROM employees
WHERE employeenumber = '1703';
-- this statement returns 'child record error'

-- Q6 SOLUTION --
DELETE FROM employees
WHERE employeenumber = '1777';
-- Yes, It does works. Because I removed child record. 

-- Q7 SOLUTION --
INSERT ALL 
INTO employees VALUES ('1703', 'Lim', 'Saetbyeol', 'x32325', 'slim62@myseneca.ca', '4', '1088', 'Accountant')
INTO employees VALUES ('1777', 'choi', 'soojung', 'x7777', 'sjchoi@myseneca.ca', '2', '1703', 'Cashier')
SELECT * FROM dual;

-- Q8 SOLUTION --
DELETE FROM employees
WHERE employeenumber IN ('1703', '1777');

--DROP TABLE employees;

