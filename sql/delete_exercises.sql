USE codeup_test_db;

SELECT name FROM albums WHERE release_date > 1991;
DELETE FROM albums WHERE release_date >= 1991;

SELECT name FROM albums where genre LIKE '%disco%';
DELETE FROM albums WHERE genre LIKE '%disco%';

SELECT name FROM albums WHERE artist LIKE '%Whitney Houston%';
DELETE FROM albums WHERE artist LIKE '%Whitney Houston%';