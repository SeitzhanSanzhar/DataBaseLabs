CREATE DATABASE lab2;

CREATE TABLE countries (
  country_id SERIAL PRIMARY KEY ,
  country_name varchar(50),
  region_id INTEGER,
  population INTEGER
);

INSERT INTO countries VALUES (DEFAULT ,'Kazakhstan', 1, 18000000);
SELECT * FROM countries;

INSERT INTO countries (country_name) VALUES ('Japan');
UPDATE countries SET region_id = NULL;

INSERT into countires VALUES (DEFAULT, 'Russian', 4, 144000000),
                             (DEFAULT, 'Brazil', 9, 207000000);

ALTER TABLE countries
    ALTER country_name SET DEFAULT 'Kazakhstan';

INSERT INTO countries (country_name) VALUES (DEFAULT);
INSERT INTO countries DEFAULT VALUES ;

CREATE TABLE countries_new(
  LIKE countries
);

INSERT INTO countries_new
    SELECT * FROM countries;

UPDATE countries_new
  SET region_id = 1
    WHERE region_id ISNULL ;

UPDATE countries SET population = population * 1.1
  RETURNING country_name, population AS new_population;

DELETE FROM countries
    WHERE population < 100000;

DELETE FROM countries_new AS c USING countries AS c1
  WHERE c.country_id = c1.country_id
    RETURNING *;

DELETE FROM countries
  RETURNING *;