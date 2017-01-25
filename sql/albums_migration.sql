USE codeup_test_db;

DROP TABLE IF EXISTS albums;

CREATE TABLE IF NOT EXISTS  `albums` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `artist` VARCHAR(300) NOT NULL,
  `name` VARCHAR(300) NOT NULL,
  `release_date` INT NOT NULL,
  `sales` FLOAT,
  `genre` VARCHAR(300),
  PRIMARY KEY (id)
)
  ENGINE=InnoDB
  DEFAULT CHARSET=utf8

