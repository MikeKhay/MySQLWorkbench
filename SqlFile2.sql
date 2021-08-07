CREATE DATABASE IF NOT EXISTS mini_model_shop;

USE mini_model_shop;

CREATE TABLE IF NOT EXISTS goods(
	id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(70) NOT NULL,
    description TEXT,
    category VARCHAR(50) NOT NULL,
    code VARCHAR(15) NOT NULL UNIQUE,
    scale VARCHAR(6) DEFAULT '1:10',
    qty_in_stock SMALLINT NOT NULL,
    price DECIMAL(6,2) NOT NULL, #999,99
    created_at DATE NOT NULL # 2021-08-01
);

DROP TABLE goods;

INSERT INTO goods(name, description, category, code, scale, qty_in_stock, price, created_at)
VALUES("cap","head","overdress","0001","4","1","50","2021-08-01"),
("palto","body","overdress","0023","0046","3","150","2021-07-15"),
("jeans","leg","overdress","00034","0006","2","570","2021-06-20"),
("gymshoes","feet","overdress","0034","0054","2","30","2021-07-27");

INSERT INTO goods(name, description, category, code, scale, qty_in_stock, price, created_at)
values("sweter","body","overdress","0087","4456","1","800","2021-06-30"),
("jacket","body","overdress","0432","0326","3","950","2021-07-12"),
("jeans","body","overdress","0353","0234","1","570","2021-06-23"),
("sneakers","feet","overdress","0846","0543","3","140","2021-07-01");

SELECT * FROM goods;

SELECT COUNT(*) FROM goods;
SELECT COUNT(*) AS qty FROM goods WHERE description = 'body';
SELECT COUNT(description) FROM goods;

SELECT AVG(qty_in_stock) FROM goods WHERE price>500;
SELECT AVG(qty_in_Stock), COUNT(description) FROM goods;

SELECT MAX(price) FROM goods;
SELECT * FROM goods WHERE price = (SELECT MAX(price) FROM goods);
SELECT * FROM goods ORDER BY price DESC LIMIT 3;

SELECT MIN(price) FROM goods;
SELECT * FROM goods ORDER BY price ASC LIMIT 4;

SELECT SUM(qty_in_stock) AS total_sum FROM goods;
SELECT SUM(qty_in_stock) AS total_sum_feet FROM goods WHERE description = 'feet';
SELECT SUM(qty_in_stock) FROM goods WHERE category IS NOT NULL;

SELECT * FROM goods WHERE description LIKE 'b%';
SELECT * FROM goods WHERE description LIKE '%t';
SELECT * FROM goods WHERE description LIKE '%e%';
SELECT * FROM goods WHERE description LIKE '____d%';
SELECT * FROM goods WHERE description LIKE 'F_%';
SELECT * FROM goods WHERE description LIKE 'H%d';

SELECT * FROM goods WHERE price<600 AND price>300;
SELECT * FROM goods WHERE id IN(1,3,7);

UPDATE goods SET name = 'undate jeans' WHERE id IN(3,7); 

DELETE FROM goods WHERE id = 8;
DELETE FROM goods;

ALTER TABLE goods ADD COLUMN color VARCHAR(25) AFTER code;
ALTER TABLE goods MODIFY COLUMN color VARCHAR(15);
ALTER TABLE goods RENAME COLUMN color TO product_color;
ALTER TABLE goods DROP COLUMN product_color;