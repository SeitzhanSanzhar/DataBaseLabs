create database  lab8_1;

CREATE TABLE departments(
  departments_id serial
);

CREATE TABLE employees(
  departments_id serial
);


create index  country_name  on counts(name);

CREATE INDEX country_name ON countries(name);
CREATE INDEX employee_ns ON employees(name,surname);
CREATE UNIQUE INDEX salary_comp ON employees(salary) where salary>value1 AND salary<value2;
CREATE INDEX sub_name ON employees(substring(name from 1 to 4));
CREATE INDEX id_salary ON employees(department_id, salary) WHERE salary<value2;
CREATE INDEX id_budget ON departments(department_id, budget) WHERE budget>value2;