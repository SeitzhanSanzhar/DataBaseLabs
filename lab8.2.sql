create database lab8; 
 
create table salesman( 
 salesman_id int primarykey, 
 name varchar(30), 
 city varchar(30), 
 commission numeric 
); 
 
create table customers( 
 customer_id int primary key, 
 cust_name varchar(30), 
 city varchar(30), 
 grade int, 
 salesman_id int referenced(salesman) 
); 
 
create table orders( 
 ord_no int primary key, 
 purch_amt numeric, 
 ord_date date, 
 customer_id int referenced customers, 
 salesman_id int referenced salesman 
); 
 
create role junior_dev; 
grant login, password on salesman, customers, orders to junior_dev; 
 
create view avg_total as 
 select name, avg(purch_amt), sum(purch_amt) from salesman as s 
  join orders as o on (s.salesman_id=o.salesman_id) 
   group by s.name; 
 
create view ord_num as 
 select city, count(*) from salesman as s 
  join orders as o on(s.salesman_id=o.salesman_id) 
   group by city; 
grant all privileges on salesman, customers, orders to junior_dev; 
 
create view low_cust as 
 select cust_name from customers 
  where grade = min(grade) 
   group by grade; 
grant select on salesman, customers, orders to junior_dev; 
 
create view sal_num as 
 select grade, count(*) from customers as c 
  join salesman as s on(c.salesman_id=s.salesman_id) 
   group by grade; 
create view show_sal as 
 select name from salesman as s 
  join orders as o on(s.salesman_id=o.salesman_id) 
   group by s.salesman_id 
    having count(*)>1; 
 
create role intern; 
reassign owned by junior_dev to intern;