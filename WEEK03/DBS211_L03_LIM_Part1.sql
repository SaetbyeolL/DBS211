-- ***********************
-- Name: Saetbyeol Lim
-- ID: 149814212
-- Date: 6/3/2022
-- Purpose: Lab 03 DBS211 � Part 1
-- ***********************
SET AUTOCOMMIT ON;

-- Q1 SOLUTION --
SELECT customernumber as "Customer Number", customername as "Customer Name", contactfirstname || ' ' || contactlastname as "Contact Name",phone as "Phone Number"
FROM dbs211_customers
WHERE city = 'Madrid'
ORDER BY customernumber DESC;

-- Q2 SOLUTION --
SELECT DISTINCT customernumber 
FROM dbs211_payments 
ORDER BY customernumber 
FETCH next 10 ROWS ONLY;

-- Q3 SOLUTION --
SELECT customernumber, checknumber, paymentdate, amount 
FROM dbs211_payments 
WHERE amount > 100000 AND paymentdate NOT BETWEEN to_date('2003/1/31', 'YYYY/mm/dd') AND to_date('2003/12/31', 'YYYY/mm/dd') 
ORDER BY amount DESC;

-- Q4 SOLUTION --
SELECT ordernumber, orderdate, status, customernumber 
FROM dbs211_orders 
WHERE status = 'On Hold' OR status = 'In Process' 
ORDER BY orderdate;

-- Q5 SOLUTION --
SELECT productcode, productname, buyprice, msrp, msrp - buyprice AS "markup", round((100*(msrp - buyprice)) / buyprice, 1) AS "percmarkup" 
FROM dbs211_products 
WHERE round(100*(msrp - buyprice) / buyprice, 1) > 140 
ORDER BY round(100*(msrp - buyprice) / buyprice, 1);

-- Q6 SOLUTION --
select customernumber, customername, phone
from dbs211_customers
where customername like 'C%'and customername like '%Co.'
or customername like 'c%' and customername like '%Co.'
order by customernumber;