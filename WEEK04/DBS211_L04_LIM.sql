-- ***********************
-- Name: Saetbyeol Lim
-- ID: 149814212
-- Date: 10-6-2022
-- Purpose: Lab 04 DBS211
-- ***********************
SET AUTOCOMMIT ON;
-- Q1 SOLUTION --
SELECT
   customernumber AS "Customer Number", customername AS "Customer Name",
   city AS "City",
   creditlimit AS "Credit Limit",
   salesrepemployeenumber AS "Sales Advisor Id",
   e.firstname || e.lastname AS "Sales Advisor Name" 
FROM
   dbs211_customers c 
JOIN
      dbs211_employees e 
ON c.salesrepemployeenumber = e.employeenumber 
WHERE
   c.city = 'NYC' 
   OR c.city = 'Paris' 
   OR c.city = 'Vancouver' 
ORDER BY
   c.city,
   c.customernumber;

-- Q2 Solution –-
SELECT
   employeenumber AS "Employee Number",
   lastname || ', ' || firstname AS "Employee Name",
   phone AS "Phone",
   extension AS "Extension",
   country AS "Country" 
FROM
   dbs211_employees e 
   JOIN
      dbs211_offices o 
      ON e.officecode = o.officecode 
WHERE
   o.country = 'UK' 
   OR o.country = 'Japan' 
ORDER BY
   e.employeenumber;

-- Q3 Solution –-
SELECT
   customernumber AS "Customer Number",
   customername AS "Customer Name",
   e.firstname || ' ' || e.lastname AS "Salesperson Name",
   e.email AS "Salesperson Email" 
FROM
   dbs211_customers c 
   JOIN
      dbs211_employees e 
      ON c.salesrepemployeenumber = e.employeenumber 
WHERE
   c.customernumber = 114 
   OR c.customernumber = 119 
   OR c.customernumber = 121 
ORDER BY
   customernumber;

-- Q4 Solution –-
SELECT
   p.productcode AS "product code",
   p.productname AS "product name",
   p.quantityinstock AS "quantity",
   p.buyprice AS "price" 
FROM
   dbs211_products p 
      LEFT JOIN
      dbs211_orderdetails o 
      ON p.productcode = o.productcode 
WHERE
   o.quantityordered IS NULL 
   AND o.ordernumber IS NULL
ORDER BY
   p.productcode;

-- Q5 Solution –-
CREATE or replace view customer_report AS 
SELECT
   c.customernumber,
   c.customername,
   c.phone,
   c.city,
   o.ordernumber,
   o.orderdate,
   o.status 
FROM
   dbs211_customers c 
   JOIN
      dbs211_orders o 
      ON c.customernumber = o.customernumber 
WHERE
   o.status = 'Cancelled';

-- Q6 Solution –-
SELECT
   customernumber,
   customername,
   phone,
   city,
   ordernumber,
   to_char(orderdate, 'DD-MON-YY')AS orderdate,
   status 
FROM
   customer_report 
ORDER BY
   customernumber;

-- Q7 Solution –-
CREATE 
OR replace view customer_report AS 
SELECT
   c.customernumber,
   c.customername,
   c.phone,
   c.city,
   o.ordernumber,
   o.orderdate,
   o.status 
FROM
   dbs211_customers c 
   FULL JOIN
      dbs211_orders o 
      ON c.customernumber = o.customernumber 
WHERE
      o.status = 'Cancelled' 
      OR o.status IS NULL 
      AND (c.city = 'Madrid' OR c.city = 'Berlin')
ORDER BY
   city,
   customernumber;

-- Q8 Solution –-
SELECT
   customernumber,
   customername,
   phone,
   city,
   ordernumber,
   to_char(orderdate, 'DD-MON-YY')AS orderdate,
   status 
FROM
   customer_report  
ORDER BY
   city,
   customernumber;

-- Q9 Solution –-
SELECT
   customernumber,
   customername,
   city 
FROM
   customer_report 
WHERE
   city = 'Madrid' 
   AND ordernumber IS NULL;

-- Q10 Solution –-
DROP view customer_report;


