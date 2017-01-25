SELECT * FROM employees
WHERE gender = 'M'
      AND (first_name = 'Irena'
           OR first_name= 'Vidya'
           OR first_name ='Maya')
ORDER BY last_name ASC, first_name ASC;

SELECT first_name, last_name
FROM employees
WHERE last_name LIKE 'e%'
      AND last_name like '%e';

SELECT first_name, last_name
FROM employees
WHERE hire_date BETWEEN '1990-01-01' AND '1999-12-31'
      AND (birth_date LIKE '%12-25%');

SELECT first_name, last_name
FROM employees
WHERE last_name LIKE '%q%'
      AND NOT last_name LIKE '%qu%';

