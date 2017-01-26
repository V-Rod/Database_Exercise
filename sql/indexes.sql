USE employees;
DESCRIBE departments;
DESCRIBE dept_emp;
DESCRIBE dept_manager;
describe employees;
DESCRIBE salaries;
DESCRIBE titles;

USE codeup_test_db;
SHOW tables;
DESCRIBE albums;

ALTER TABLE albums
    ADD UNIQUE (name);

INSERT INTO albums (artist, name, release_date)
    VALUES ('Michael Jackson', 'Thriller', '1982');