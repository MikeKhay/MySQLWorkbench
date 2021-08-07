CREATE DATABASE IF NOT EXISTS info_country;

DROP DATABASE info_country;

USE info_country;

CREATE TABLE IF NOT EXISTS country(
	id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(30) NOT NULL UNIQUE,
    population INT NOT NULL
);

CREATE TABLE IF NOT EXISTS capital(
	id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(30) NOT NULL,
    FOREIGN KEY(id) REFERENCES country(id)
);

CREATE TABLE IF NOT EXISTS city(
	id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(30) NOT NULL,
    square INT,
    country_id INT,
    FOREIGN KEY (country_id) REFERENCES country(id)
);

CREATE TABLE IF NOT EXISTS market(
	id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(30) NOT NULL
);

CREATE TABLE IF NOT EXISTS city_market(
	city_id INT NOT NULL,
    market_id INT NOT NULL,
    FOREIGN KEY (city_id) REFERENCES city(id),
    FOREIGN KEY (market_id) REFERENCES market(id)
);

INSERT INTO country VALUES
	(1,'Ukraine', 48000000),
	(2,'France', 20000000),
	(3,'Spain', 17000000),
	(4,'Poland', 35000000);

INSERT INTO capital VALUE
	(1,'Kyiv'),
	(2,'Paris'),
    (3,'Madrid'),
    (4,'Warsaw');
    
SELECT * FROM country INNER JOIN capital ON country.id= capital.id;

INSERT INTO city VALUES
	(1,'Lviv', 2300000, 1),
    (2,'Kharkiv', 1500000, 1),
    (3,'Odesa', 1750000, 1),
    (4,'Marseille', 530000, 2),
    (5,'Toulouse', 90000, 2),
    (6,'Strasbourg', 47000, 2),
    (7,'London', 460000, null),
    (8,'Katovice', 670000, 4);
    
SELECT *
FROM country
INNER JOIN capital
ON country.id = capital.id
INNER JOIN city
ON country.id = city.country_id;

SELECT country.name, country.population, capital.name, city.name
FROM country
INNER JOIN capital
ON country.id = capital.id
LEFT JOIN city
ON country.id = city.country_id;

SELECT country.name, country.population, capital.name, city.name
FROM country
INNER JOIN capital
ON country.id = capital.id
RIGHT JOIN city
ON country.id = city.country_id;

SELECT country.name, country.population, capital.name, city.name
FROM country
INNER JOIN capital
ON country.id = capital.id
LEFT JOIN city
ON country.id = city.country_id
UNION
SELECT country.name, country.population, capital.name, city.name
FROM country
INNER JOIN capital
ON country.id = capital.id
RIGHT JOIN city
ON country.id = city.country_id;

SELECT country.name, country.population, capital.name, city.name
FROM country
INNER JOIN capital
ON country.id = capital.id
LEFT JOIN city
ON country.id = city.country_id
WHERE city.country_id IS NULL;

SELECT country.name, country.population, capital.name, city.name
FROM country
INNER JOIN capital
ON country.id = capital.id
RIGHT JOIN city
ON country.id = city.country_id
WHERE country.id IS NULL;