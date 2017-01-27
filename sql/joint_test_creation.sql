CREATE DATABASE IF NOT EXISTS join_test_db;
USE join_test_db;

CREATE TABLE roles (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT,
  name VARCHAR(100) NOT NULL,
  PRIMARY KEY (id)
);

CREATE TABLE users (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT,
  name VARCHAR(100) NOT NULL,
  email VARCHAR(100) NOT NULL,
  role_id INT UNSIGNED DEFAULT NULL,
  PRIMARY KEY (id),
    FOREIGN KEY (role_id) REFERENCES roles (id)
);

INSERT INTO roles (name) VALUES ('admin');
INSERT INTO roles (name) VALUES ('author');
INSERT INTO roles (name) VALUES ('reviewer');
INSERT INTO roles (name) VALUES ('commenter');

INSERT INTO users (name, email, role_id) VALUES
  ('bob', 'bob@example.com', 1),
  ('joe', 'joe@example.com', 2),
  ('sally', 'sally@example.com', 3),
  ('adam', 'adam@example.com', 3),
  ('jane', 'jane@example.com', null),
  ('mike', 'mike@example.com', null);

INSERT INTO users (name, email, role_id) VALUES
  ('pierre', 'pierre@pierre.com', 2),
  ('kevin', 'kevin@kevin.com', 2),
  ('papo', 'papo@papo.com', 2),
  ('v-rod', 'v-rod@vrod.com', NULL );

# Inner Join (ignore all nulls)
SELECT users.name as user_name, roles.name as roles_name
FROM users
JOIN roles ON users.role_id = roles.id;

# Left Join (this reflects the nulls)
SELECT users.name as user_name, roles.name as roles_name
from users
LEFT JOIN roles ON users.role_id = roles.id;

# Right Join
SELECT users.name AS user_name, roles.name AS roles_name
FROM users
RIGHT JOIN roles ON users.role_id = roles.id;

# Show the count of users with each role
SELECT roles.name AS role_name, count(users.name) AS "users with this role"
FROM users
RIGHT JOIN roles ON users.role_id = roles.id
GROUP BY roles.name ORDER BY `users with this role`;



# Employees Database

USE employees;

# write a query that shows each department along with the name of the current manager for that department.
# look on the first table for foreign keys that reference other tables
# if no foreign keys, search for a table that does have the dept_no as a foreign key

SELECT CONCAT(employees.first_name, ' ', employees.last_name) AS "manager name", dept_name AS "department name"
FROM departments
  JOIN dept_manager on dept_manager.dept_no = departments.dept_no
  JOIN employees on dept_manager.emp_no = employees.emp_no
WHERE dept_manager.to_date > curdate()
ORDER BY `department name`;

# Find the name of all departments currently managed by women

SELECT CONCAT(managers.first_name, ' ', managers.last_name) AS "Manager Name", dept_name AS "Department Name"
FROM departments
  JOIN dept_manager ON departments.dept_no = dept_manager.dept_no
  JOIN employees as managers ON dept_manager.emp_no = managers.emp_no
WHERE dept_manager.to_date > curdate() AND managers.gender = 'F'
ORDER BY `Department Name` ;

# Find the current titles of employees currently working in the Customer Service department
SELECT titles.title AS "Title", count(employees.emp_no) AS "Count"
FROM titles
JOIN employees ON titles.emp_no = employees.emp_no
JOIN dept_emp ON dept_emp.emp_no = employees.emp_no
JOIN departments ON dept_emp.dept_no = departments.dept_no
  WHERE titles.to_date > curdate()
        AND dept_emp.to_date > curdate()
        AND departments.dept_name = 'Customer Service'
GROUP BY Title;

# Find the current salary of all current managers.
SELECT departments.dept_name AS "Departments", employees.first_name, employees.last_name, salary
FROM salaries
JOIN employees on salaries.emp_no = employees.emp_no
JOIN dept_manager ON employees.emp_no = dept_manager.emp_no
  JOIN departments ON dept_manager.dept_no = departments.dept_no
WHERE dept_manager.to_date > curdate()
AND salaries.to_date > curdate()
ORDER BY Departments;

SELECT concat(e.first_name, ' ', e.last_name) as "Employee", departments.dept_name, concat(managers.first_name, ' ', managers.last_name) AS "Manager"
from employees as e
join dept_emp on e.emp_no = dept_emp.emp_no
join departments on dept_emp.dept_no = departments.dept_no
join dept_manager on departments.dept_no = dept_manager.dept_no
JOIN employees as managers ON dept_manager.emp_no = managers.emp_no
WHERE dept_emp.to_date > curdate()
and dept_manager.to_date > curdate();







