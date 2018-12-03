CREATE database lab66;

create table locations(
  location_id serial primary key,
  street_address varchar(25),
  postcal_code varchar(12),
  city varchar(30),
  state_province varchar(12)
);

create table departments(
  department_id serial primary key,
  department_name varchar(50) unique,
  budget integer,
  location_id integer references locations
);
create table employees(
  employee_id serial primary key,
  first_name varchar(50),
  last_name varchar(50),
  email varchar(50),
  phone_number varchar(50),
  salary integer,
  manager_id integer references employees,
  department_id integer references departments
);
create table job_grades(
  grade char(1),
  lowest_salary integer,
  highest_salary integer
);

SELECT *from departments;
select *from employees;
select *from locations;
select *FROM job_grades;

select e.first_name, e.last_name, d.department_id, l.city, l.state_province
from employees e join departments d on e.department_id = d.department_id join locations l on d.location_id = l.location_id;

select e.first_name, e.last_name, e.salary, j.grade from employees e join job_grades j on e.salary between j.lowest_salary and j.highest_salary;

select e.first_name, e.last_name, e.salary from employees e
  join employees s on e.salary < s.salary and s.employee_id = 120;

select e.first_name AS "Employee name", m.first_name "Manager" from employees e join employees m on e.manager_id = m.employee_id;

select e.first_name, e.last_name, d.department_name, d.department_id from employees e left join departments d on e.department_id = d.department_id;
