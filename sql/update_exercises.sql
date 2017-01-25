USE codeup_test_db;

SELECT 'All albums in the table where sales are 10X';
UPDATE albums
SET sales = sales*10;

SELECT * FROM albums WHERE release_date < 1980;
UPDATE albums
SET release_date = 1800
WHERE release_date <= 1980;

SELECT name FROM albums WHERE artist = 'Michael Jackson';
UPDATE albums
SET artist = 'Peter Jackson'
WHERE artist = 'Michael Jackson';