SELECT count(*), gender AS "Num Emp by Gender"
FROM employees
WHERE (first_name = 'Irena'
           OR first_name= 'Vidya'
           OR first_name ='Maya')
GROUP BY gender;

SELECT concat(first_name, " ", last_name) AS "Full Name"
FROM employees
WHERE last_name LIKE 'e%'
      AND last_name like '%e';

SELECT first_name, last_name, datediff(now(), hire_date) AS "Time Working in Company"
FROM employees
WHERE hire_date BETWEEN '1990-01-01' AND '1999-12-31'
      AND (birth_date LIKE '%12-25%');


SELECT concat(first_name, " ", last_name) as "full_name", count(first_name) AS "number with people with this name"
FROM employees
WHERE last_name LIKE '%q%'
      AND last_name NOT LIKE '%qu%'
GROUP BY full_name
ORDER BY `number with people with this name` DESC;


