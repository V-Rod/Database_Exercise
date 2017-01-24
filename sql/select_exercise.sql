USE codeup_test_db;

SELECT 'The name of all albums by Pink Floyd' AS 'Exercise 1';
SELECT name
FROM albums
WHERE artist = 'Pink Floyd';

SELECT release_date
FROM albums
WHERE name = 'Sgt. Peppers Lonely Hearts Club Band';

SELECT genre
FROM albums
where name = 'Nevermind';

SELECT name
FROM albums
where release_date BETWEEN 1990 AND 1999;

SELECT name
FROM albums
where sales < 20000000;

SELECT name
FROM albums
where genre LIKE '%rock%';

