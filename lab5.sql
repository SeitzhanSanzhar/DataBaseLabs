CREATE DATABASE lab5;
CREATE TABLE salesmans(
  salesman_id INTEGER PRIMARY KEY ,
  name VARCHAR(250),
  city VARCHAR(250),
  comisson FLOAT
);
CREATE TABLE customers(
customer_id INTEGER PRIMARY KEY,
cust_name VARCHAR(250),
city VARCHAR(250),
grade INT,
salesman_id INTEGER REFERENCES salesmans
);
CREATE TABLE orders(
ord_no INT,
purch_amt FLOAT,
ord_date DATE,
customer_id INTEGER REFERENCES customers,
salesman_id INTEGER REFERENCES salesmans
);

SELECT sum(purch_amt) FROM orders;
SELECT avg(purch_amt) FROM orders;
SELECT count(cust_name) FROM customers WHERE cust_name IS NOT NULL;
SELECT purch_amt FROM orders ORDER BY purch_amt ASC LIMIT 1;
SELECT * FROM customers WHERE cust_name LIKE '%b';
SELECT * FROM orders WHERE customer_id = (SELECT customer_id FROM customers WHERE city = 'New York');
SELECT * FROM customers WHERE EXISTS(SELECT * FROM orders WHERE orders.customer_id = customers.customer_id AND purch_amt > 10);
SELECT sum(grade) FROM customers;
SELECT * FROM customers WHERE cust_name IS NOT NULL;
SELECT max(grade) FROM customers;