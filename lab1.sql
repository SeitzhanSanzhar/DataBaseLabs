CREATE DATABASE lab1;

CREATE TABLE users (
  id SERIAL PRIMARY KEY ,
  firt_name varchar(50),
  last_name varchar(50)
)

ALTER TABLE users ADD COLUMN admin int;
ALTER TABLE users ALTER COLUMN admin DROP DEFAULT;
ALTER TABLE ALTER COLUMN admin Type bool using admin :: boolean;

ALTER TABLE users ALTER COLUMN admin SET DATA TYPE boolean;
ALTER TABLE users ALTER COLUMN admin SET DEFAULT false;

ALTER TABLE users ADD constraint use PRIMARY KEY (id);

CREATE TABLE data (
  id SERIAL,
  user_name varchar(50),
  user_id int
);